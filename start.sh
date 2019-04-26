#!/bin/bash
# Ruby on Rails API (backend) running at 8081 port
# Reactjs (frontend) running at 8080 port

sudo service postgresql stop;
sudo service postgresql start;

rails s -b $IP -p 8081 &

cd frontend;

yarn start
