from flask import Flask, render_template, redirect, url_for, request, g,json,session,jsonify
from dockerFunction import createContainers

app = Flask(__name__)
app.secret_key = "hjtTO6DZulWQyqSYOfuyjXkLYOTVhQBfBkAmUD6UNATf42hX2pSJhlHw1OpWr4KL"


@app.route('/test', methods=['POST'])
def devices():
    content = request.json
    uid=content['uid']
    port=createContainers(uid)
    #print(uid)
    data= {
        'uid':uid,
        'port':port
        }
    
    return jsonify(data)


if __name__ == '__main__':
    app.run(debug=True)