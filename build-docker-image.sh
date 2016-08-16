#!/bin/bash

VERSION=$(cat version.txt)
docker build -t segence/flume:$VERSION .

