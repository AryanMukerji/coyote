from flask import Flask, render_template, redirect, url_for, request, g,json,session,jsonify

app = Flask(__name__)
app.secret_key = "hjtTO6DZulWQyqSYOfuyjXkLYOTVhQBfBkAmUD6UNATf42hX2pSJhlHw1OpWr4KL"


@app.route('/devices', methods=['GET','POST'])
def devices():
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

@app.route('/devices/<id>', methods = ['GET','POST'])
def iddata(id):
    data = {
        "id":id,
        "Name": "Device " + id,
        "Status": "Working",
        "Value": 3.14
    }

    return jsonify(data)

@app.route('/devices/<id>/<cmd>', methods = ['GET','POST'])
def cmddata(id,cmd):

    data = {
        "id":id,
        "Name": "Device " + id,
        "Status": cmd,
        "Value": 3.14
    }

    return jsonify(data)


if __name__ == '__main__':
    app.run(debug=True)