from flask import Flask,request,jsonify
from flask_restful import Resource, Api
from booklet import *

app = Flask(__name__)
api = Api(app)

@app.route('/',methods=['GET'])
def home():
	return'''<div><center><h1>Hello from API </h1></center></div> '''
@app.route('/api/v1/booklet',methods=['GET'])
def booklet_api():
	return jsonify({'data':booklet})

if __name__ == '__main__':
	app.run(host ='192.168.43.193',debug=True)