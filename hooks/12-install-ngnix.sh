#!/bin/bash
add-apt-repository -y ppa:nginx/stable
apt-get update
apt-get install -qq nginx
