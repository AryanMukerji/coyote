from flask import Flask, render_template, redirect, url_for, request, g,json,session,jsonify

app = Flask(__name__)
app.secret_key = "hjtTO6DZulWQyqSYOfuyjXkLYOTVhQBfBkAmUD6UNATf42hX2pSJhlHw1OpWr4KL"


@app.route('/devices', methods=['POST'])
def devices():
    content = request.json()
    uid=content['uid']
    #funcion of docker data return
    print(uid)
    data= [
        {
            "id": 1,
            "name": "Tubelight"

        },

        {
            "id": 2,
            "name": "Fan"

        },

        {
            "id": 3,
            "name": "Aquarium"

        },




        ]
    
    return jsonify(data)

@app.route('/devices/<id>', methods = ['POST'])
def iddata(id):
    #docker funtion here

    data = {
        "id":id,
        "Name": "Device " + id,
        "Status": "Working",
        "Value": 3.14
    }

    return jsonify(data)

@app.route('/devices/<id>/<cmd>', methods = ['POST'])
def cmddata(id,cmd):
    #docker funtion here
    data = {
        "id":id,
        "Name": "Device " + id,
        "Status": cmd,
        "Value": 3.14
    }

    return jsonify(data)


if __name__ == '__main__':
    app.run(debug=True)