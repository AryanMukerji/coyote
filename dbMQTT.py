from paho.mqtt import client as mqtt_client
import sqlite3, json, schedule
import time

broker = '127.0.0.1'
port = 1883
topicget = "devices/request"
topicsend = "devices/response"
client_id = 'dbMQTT'


con = sqlite3.connect('database.db')
con.execute('CREATE TABLE IF NOT EXISTS mqttdevices ( clientid TEXT PRIMARY KEY , controltopic TEXT )')

def connect_mqtt():
    def on_connect(client, userdata, flags, rc):
        if rc == 0:
            print("Connected to MQTT Broker!")
        else:
            print("Failed to connect, return code %d\n", rc)

    client = mqtt_client.Client(client_id)
    client.on_connect = on_connect
    client.connect(broker, port, keepalive=500)
    return client

def publish(client,topic,msg):
    result = client.publish(topic, msg)
    status = result[0]
    if status == 0:
        print(f"Send `{msg}` to topic `{topic}`")
    else:
        print(f"Failed to send message to topic {topic}")

def subscribe(client: mqtt_client):

    def on_message(client, userdata, msg):

        print(f"Received `{msg.payload.decode()}` from `{msg.topic}` topic")
        if msg.topic=="devices/request":
            if msg.payload.decode().startswith('getdevices'):
                con = sqlite3.connect('database.db')
                cur = con.cursor()
                cur.execute("SELECT * FROM mqttdevices")
                rows = cur.fetchall()
                data=[]
                for row in rows:
                    dev={
                    'devid':row[0],
                    'devtopic':row[1]
                    }
                    data.append(dev)
                publish(client,topicsend,json.dumps(data))
                con.close()

            elif msg.payload.decode().startswith('adddevice'):
                id,topic=msg.payload.decode().split(':')[1],msg.payload.decode().split(':')[2]
                try:
                    con = sqlite3.connect('database.db')
                    cur = con.cursor()
                    cur.execute('INSERT INTO mqttdevices (clientid,controltopic) VALUES (?,?)',(id,topic))
                    con.commit()
                    con.close()
                except:
                    pass
            
            elif msg.payload.decode().startswith('rmdevice'):
                id,topic=msg.payload.decode().split(':')[1],msg.payload.decode().split(':')[2]
                try:
                    con = sqlite3.connect('database.db')
                    id,topic=msg.payload.decode().split(':')[1],msg.payload.decode().split(':')[2]
                    con = sqlite3.connect('database.db')
                    cur = con.cursor()
                    cur.execute('DELETE FROM mqttdevices WHERE clientid=?',(id,))
                    con.commit()
                    con.close()
                except:
                    pass

        if msg.topic=="flows":
            print("working")
            jsondata=json.loads(msg.payload.decode())
            timex=jsondata['time']
            timex=timex[10:15]
            devices=jsondata['devices']
            schedule.every().day.at(timex).do(timebasedjob,devices=devices,client=client)
            print("Done schedulig")
            n=schedule.idle_seconds()
            print(n)
            time.sleep(n)
            schedule.run_all()


    client.subscribe(topicget)
    client.subscribe("flows")
    client.on_message = on_message
    schedule.run_pending()

def timebasedjob(devices,client):
    print("Running job")
    print(devices)
    for k in devices:
        if devices[k]==True:
            cmd="ON"
        else:
            cmd="OFF"
        publish(client,f"{k}/cmd",cmd)


client = connect_mqtt()
subscribe(client)
schedule.run_pending()
client.loop_forever()