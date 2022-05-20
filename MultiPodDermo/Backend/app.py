from flask import Flask, jsonify
from datetime import datetime

app = Flask(__name__)

@app.route("/")
def home():
    now = datetime.now()
    stat = str(now.time()) 
    mydict = {
        "time" : stat, 
        "service" : "alive"
    }
    return jsonify(mydict)
if __name__ == '__main__': 
    app.run(host="0.0.0.0")