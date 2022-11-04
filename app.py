from flask import Flask, render_template, redirect, url_for, request, g,json,session,jsonify
import random

app = Flask(__name__)
app.secret_key = "hjtTO6DZulWQyqSYOfuyjXkLYOTVhQBfBkAmUD6UNATf42hX2pSJhlHw1OpWr4KL"


@app.route('/test', methods=['POST'])
def devices():
    content = request.json
    uid=content['uid']
    #funcion of docker data return
    #print(uid)
    data= {
        'uid':uid,
        'port':random.randrange(2000,6000)
        }
    
    return jsonify(data)


if __name__ == '__main__':
    app.run(debug=True)