#!/bin/bash

echo "Speedtest-cli will now run 3 *DOWNLOAD ONLY* tests, Please wait!";
sleep 2

speedtest-cli --no-upload;
speedtest-cli --no-upload;
speedtest-cli --no-upload

echo "Complete! Speedtest++ will now run 2 *DOWNLOAD ONLY* tests, Please wait!"
sleep 2

speedtest++ --download;
speedtest++ --download;

echo "Testing Completed!"
