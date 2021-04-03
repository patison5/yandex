# -*- coding: utf-8 -*-

from flask import Flask
from flask import request
import json

app = Flask(__name__)

class Stocks:
    def __init__(self, id, companyName, CompanyFullName, currentPrice, previousPrice, beautifullPreviousPrice, beautifullPrice, imageURL, currecy):
        self.id = id
        self.companyName = companyName
        self.companyFullName = CompanyFullName
        self.currentPrice = currentPrice
        self.previousPrice = previousPrice
        self.beautifullPreviousPrice = beautifullPreviousPrice
        self.beautifullPrice = beautifullPrice
        self.imageURL = imageURL
        self.currency = currecy

    #  советуют также искользовать jsonpickle - более удобный инструмент сериализации в JSON
    def toJSON(self):
        return json.dumps(self, default=lambda o: o.__dict__, sort_keys=True, indent=4)

usersList = {"stocks": []}
usersList["stocks"].append(Stocks(0, "AAPL", "Apple Inc., LLC", 138.93, 133.73, "+$0.12 (1,15%)", "$131.93", "https://sun9-51.userapi.com/impf/4DuVprsGucvUYq02dsVu5iJImrTOleNDQzkzCg/k5yXLmztE2E.jpg?size=52x52&quality=96&sign=c1914ef366f44456260ee7e6003e927a&type=album", "$"))
usersList["stocks"].append(Stocks(1, "YNDX", "Yandex, LLC", 4154.6, 4763.99, "+55 ₽ (1,15%)", "4 764,6 ₽", "https://sun9-59.userapi.com/impf/SeAw_-cClwfcTv2buRg0Yea0kgsQcMtm02K4mg/FZoT3oxEUv4.jpg?size=52x52&quality=96&sign=3bfe79bf1f5c4c02ba3fc04af90c361e&type=album", "₽"))
usersList["stocks"].append(Stocks(2, "GOOGL", "Alphabet Class A", 1825., 1725.73, "+$0.12 (1,15%)", "$131.93", "https://sun9-52.userapi.com/impf/PS0xwsdfwfbDpy8iYe5q0h_yvqU-TAefo1M9-w/2g0I8yYcDeo.jpg?size=52x52&quality=96&sign=f2c0fe34bcf9f4d74e4a0671a8d303f7&type=album", "$"))
usersList["stocks"].append(Stocks(3, "AMZN", "Amazon.com", 1825., 1725.73, "+$0.12 (1,15%)", "$131.93", "https://sun9-24.userapi.com/impf/FdZlNKauFzeCwIk-6BiNl2-sGVcIx-JI6qi6vg/GUt6oibNsJU.jpg?size=52x52&quality=96&sign=fd9784ff6493bca50ecb46290f23b6c2&type=album", "$"))
usersList["stocks"].append(Stocks(4, "BAC", "Bank of America Corp", 3204.6, 3255.99, "+55 ₽ (1,15%)", "4 764,6 ₽", "https://sun9-17.userapi.com/impf/HPnja4VlMnWJcE6BhIshnInqnGQkvXaRDTocoA/25iZrAwh76s.jpg?size=52x52&quality=96&sign=ba74081f3cd6dc6d3fc9099f3a26db39&type=album", "$"))
usersList["stocks"].append(Stocks(5, "TSLA", "Tesla Motors", 3204.6, 3255.99, "+55 ₽ (1,15%)", "4 764,6 ₽", "https://sun9-23.userapi.com/impf/G2u5K9clDmAOItYIFxGkHhcQniQn4u5n8YeinA/lBDy1Rv-GOk.jpg?size=52x52&quality=96&sign=02cbed1fb99e628f9dd9229fdea548ff&type=album", "$"))

usersList["stocks"].append(Stocks(6, "AAPL", "Apple Inc., LLC", 138.93, 133.73, "+$0.12 (1,15%)", "$131.93", "https://sun9-51.userapi.com/impf/4DuVprsGucvUYq02dsVu5iJImrTOleNDQzkzCg/k5yXLmztE2E.jpg?size=52x52&quality=96&sign=c1914ef366f44456260ee7e6003e927a&type=album", "$"))
usersList["stocks"].append(Stocks(7, "YNDX", "Yandex, LLC", 4154.6, 4763.99, "+55 ₽ (1,15%)", "4 764,6 ₽", "https://sun9-59.userapi.com/impf/SeAw_-cClwfcTv2buRg0Yea0kgsQcMtm02K4mg/FZoT3oxEUv4.jpg?size=52x52&quality=96&sign=3bfe79bf1f5c4c02ba3fc04af90c361e&type=album", "₽"))
usersList["stocks"].append(Stocks(8, "GOOGL", "Alphabet Class A", 1825., 1725.73, "+$0.12 (1,15%)", "$131.93", "https://sun9-52.userapi.com/impf/PS0xwsdfwfbDpy8iYe5q0h_yvqU-TAefo1M9-w/2g0I8yYcDeo.jpg?size=52x52&quality=96&sign=f2c0fe34bcf9f4d74e4a0671a8d303f7&type=album", "$"))
usersList["stocks"].append(Stocks(9, "AMZN", "Amazon.com", 1825., 1725.73, "+$0.12 (1,15%)", "$131.93", "https://sun9-51.userapi.com/impf/4DuVprsGucvUYq02dsVu5iJImrTOleNDQzkzCg/k5yXLmztE2E.jpg?size=52x52&quality=96&sign=c1914ef366f44456260ee7e6003e927a&type=album", "$"))
usersList["stocks"].append(Stocks(10, "BAC", "Bank of America Corp", 3204.6, 3255.99, "+55 ₽ (1,15%)", "4 764,6 ₽", "https://sun9-17.userapi.com/impf/HPnja4VlMnWJcE6BhIshnInqnGQkvXaRDTocoA/25iZrAwh76s.jpg?size=52x52&quality=96&sign=ba74081f3cd6dc6d3fc9099f3a26db39&type=album", "$"))
usersList["stocks"].append(Stocks(11, "TSLA", "Tesla Motors", 3204.6, 3255.99, "+55 ₽ (1,15%)", "4 764,6 ₽", "https://sun9-23.userapi.com/impf/G2u5K9clDmAOItYIFxGkHhcQniQn4u5n8YeinA/lBDy1Rv-GOk.jpg?size=52x52&quality=96&sign=02cbed1fb99e628f9dd9229fdea548ff&type=album", "$"))

usersList["stocks"].append(Stocks(12, "AAPL", "Apple Inc., LLC", 138.93, 133.73, "+$0.12 (1,15%)", "$131.93", "https://sun9-51.userapi.com/impf/4DuVprsGucvUYq02dsVu5iJImrTOleNDQzkzCg/k5yXLmztE2E.jpg?size=52x52&quality=96&sign=c1914ef366f44456260ee7e6003e927a&type=album", "$"))
usersList["stocks"].append(Stocks(13, "YNDX", "Yandex, LLC", 4154.6, 4763.99, "+55 ₽ (1,15%)", "4 764,6 ₽", "https://sun9-59.userapi.com/impf/SeAw_-cClwfcTv2buRg0Yea0kgsQcMtm02K4mg/FZoT3oxEUv4.jpg?size=52x52&quality=96&sign=3bfe79bf1f5c4c02ba3fc04af90c361e&type=album", "₽"))
usersList["stocks"].append(Stocks(14, "GOOGL", "Alphabet Class A", 1825., 1725.73, "+$0.12 (1,15%)", "$131.93", "https://sun9-52.userapi.com/impf/PS0xwsdfwfbDpy8iYe5q0h_yvqU-TAefo1M9-w/2g0I8yYcDeo.jpg?size=52x52&quality=96&sign=f2c0fe34bcf9f4d74e4a0671a8d303f7&type=album", "$"))
usersList["stocks"].append(Stocks(15, "AMZN", "Amazon.com", 1825., 1725.73, "+$0.12 (1,15%)", "$131.93", "https://sun9-51.userapi.com/impf/4DuVprsGucvUYq02dsVu5iJImrTOleNDQzkzCg/k5yXLmztE2E.jpg?size=52x52&quality=96&sign=c1914ef366f44456260ee7e6003e927a&type=album", "$"))
usersList["stocks"].append(Stocks(16, "BAC", "Bank of America Corp", 3204.6, 3255.99, "+55 ₽ (1,15%)", "4 764,6 ₽", "https://sun9-17.userapi.com/impf/HPnja4VlMnWJcE6BhIshnInqnGQkvXaRDTocoA/25iZrAwh76s.jpg?size=52x52&quality=96&sign=ba74081f3cd6dc6d3fc9099f3a26db39&type=album", "$"))
usersList["stocks"].append(Stocks(17, "TSLA", "Tesla Motors", 3204.6, 3255.99, "+55 ₽ (1,15%)", "4 764,6 ₽", "https://sun9-23.userapi.com/impf/G2u5K9clDmAOItYIFxGkHhcQniQn4u5n8YeinA/lBDy1Rv-GOk.jpg?size=52x52&quality=96&sign=02cbed1fb99e628f9dd9229fdea548ff&type=album", "$"))

class Test:
    def __init__(self, id):
        self.id = id

test = Test(0)

@app.route('/test', methods=['GET', 'PUT', 'DELETE', 'POST'])
def ttt():
    if request.method == 'GET':
        # print(json.dumps(test, default=lambda o: o.__dict__, sort_keys=True, indent=4))
        return json.dumps(test, default=lambda o: o.__dict__, sort_keys=True, indent=4)

@app.route('/')
def main_root():
    return "Hello world"

@app.route('/api/v1/stocks/<int:stocks_id>')
def stocks_by_id(stocks_id):
    # вывести сообщение с данным
    id = int(stocks_id)
    # print(id)
    # print(len(usersList["stocks"]))
    if (id >= 0 and id < len(usersList["stocks"])):
        stock = usersList["stocks"][int(stocks_id)]
        return json.dumps(stock, default=lambda o: o.__dict__, sort_keys=True, indent=4)
    else:
         return "No user with {user_id} found"


@app.route('/api/v1/stocks', methods=['GET', 'PUT', 'DELETE', 'POST'])
def stocks():
    if request.method == 'GET':
        # print(json.dumps(usersList, default=lambda o: o.__dict__, sort_keys=True, indent=4))
        return json.dumps(usersList, default=lambda o: o.__dict__, sort_keys=True, indent=4)

@app.route('/api/v1/company/news', methods=['GET', 'PUT', 'DELETE', 'POST'])
def news():
    if request.method == 'GET':
        company_name  = request.args.get('company_name', default = "default company name", type = str)
        # print(company_name)
        return json.dumps(usersList, default=lambda o: o.__dict__, sort_keys=True, indent=4)

if __name__ == '__main__':
    app.run()
