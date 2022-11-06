#!/bin/bash

# Start the first process
mosquitto &
  
# Start the second process
python3 dbMQTT.py &
  
# Wait for any process to exit
wait -n
  
# Exit with status of process that exited first
exit $?
