from flask import Flask, request
import os

app = Flask(__name__)


@app.route('/')
def hello_world():
    return "Hello world!"


@app.route('/greet/<name>/<int:number>')
def greet(name, number):
    return f"Hello {name}! Your number is {number}."


@app.route('/greet_query')
def greet_query():
    name = request.args.get('name')
    number = request.args.get('number')
    return f"Hello {name}! Your number is {number}."


if __name__ == '__main__':
    host = os.environ.get('FLASK_RUN_HOST', 'localhost')
    app.run(host=host, port=45000)
