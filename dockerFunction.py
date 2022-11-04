import subprocess
import docker

client = docker.from_env()

def createContainers(UID):

    con = client.containers.run('aryanmukerji/mqtt-server', detach=True, name=UID, ports={"1883/tcp": None}, tty=True)
    #print("ID: " + con.id + "\nName: " + con.name + "\nStatus: " + con.status)
    
    cmd = "docker port {} 1883/tcp".format(UID)
    portNumber = subprocess.getoutput(cmd)

    #print(portNumber.split(':')[1].strip())
    return int(portNumber.split(':')[1].strip())
