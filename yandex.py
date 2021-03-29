# -*- coding: utf-8 -*-

from flask import Flask
from flask import request
import json

app = Flask(__name__)

class Stocks:
    def __init__(self, id, companyName, CompanyFullName, currentPrice, previousPrice, beautifullPreviousPrice, beautifullPrice, imageURL):
        self.id = id
        self.companyName = companyName
        self.CompanyFullName = CompanyFullName
        self.currentPrice = currentPrice
        self.previousPrice = previousPrice
        self.beautifullPreviousPrice = beautifullPreviousPrice
        self.beautifullPrice = beautifullPrice
        self.imageURL = imageURL

    #  советуют также искользовать jsonpickle - более удобный инструмент сериализации в JSON
    def toJSON(self):
        return json.dumps(self, default=lambda o: o.__dict__, sort_keys=True, indent=4)

usersList = {"stocks": []}
usersList["stocks"].append(Stocks(0, "AAPL", "Apple Inc., LLC", "131.93", "161.93", "+$0.12 (1,15%)", "$131.93", "https://sun9-51.userapi.com/impf/4DuVprsGucvUYq02dsVu5iJImrTOleNDQzkzCg/k5yXLmztE2E.jpg?size=52x52&quality=96&sign=c1914ef366f44456260ee7e6003e927a&type=album"))
usersList["stocks"].append(Stocks(0, "YNDX", "Yandex, LLC", "4764.6", "4964.6", "+55 ₽ (1,15%)", "4 764,6 ₽", "https://sun9-59.userapi.com/impf/SeAw_-cClwfcTv2buRg0Yea0kgsQcMtm02K4mg/FZoT3oxEUv4.jpg?size=52x52&quality=96&sign=3bfe79bf1f5c4c02ba3fc04af90c361e&type=album"))
usersList["stocks"].append(Stocks(0, "AAPL", "Apple Inc., LLC", "131.93", "161.93", "+$0.12 (1,15%)", "$131.93", "https://sun9-51.userapi.com/impf/4DuVprsGucvUYq02dsVu5iJImrTOleNDQzkzCg/k5yXLmztE2E.jpg?size=52x52&quality=96&sign=c1914ef366f44456260ee7e6003e927a&type=album"))
usersList["stocks"].append(Stocks(0, "YNDX", "Yandex, LLC", "4764.6", "4964.6", "+55 ₽ (1,15%)", "4 764,6 ₽", "https://sun9-59.userapi.com/impf/SeAw_-cClwfcTv2buRg0Yea0kgsQcMtm02K4mg/FZoT3oxEUv4.jpg?size=52x52&quality=96&sign=3bfe79bf1f5c4c02ba3fc04af90c361e&type=album"))


@app.route('/')
def main_root():
    return "Hello Pidor, just go to /stocks, pidor"

@app.route('/stocks/<int:stocks_id>')
def show_post(stocks_id):
    # вывести сообщение с данным
    id = int(stocks_id)
    print(id)
    print(len(usersList["stocks"]))
    if (id >= 0 and id < len(usersList["stocks"])):
        stock = usersList["stocks"][int(stocks_id)]
        return json.dumps(stock, default=lambda o: o.__dict__, sort_keys=True, indent=4)
    else:
        return "fuck you bitch"
        # return f"No user with {user_id} found"


@app.route('/stocks', methods=['GET', 'PUT', 'DELETE', 'POST'])
def user():
    if request.method == 'GET':
        return json.dumps(usersList, default=lambda o: o.__dict__, sort_keys=True, indent=4)


if __name__ == '__main__':
    app.run()
