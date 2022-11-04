import subprocess
import docker
import os

client = docker.from_env()

def createContainers(UID):

    con = client.containers.run('ubuntu', detach=True, name=UID, ports={"1883/tcp": None}, tty=True)
    #print("ID: " + con.id + "\nName: " + con.name + "\nStatus: " + con.status)
    
    cmd = "docker port {} 1883/tcp".format(UID)
    portNumber = subprocess.getoutput(cmd)

    #print(portNumber.split(':')[1].strip())
    return portNumber.split(':')[1].strip()
