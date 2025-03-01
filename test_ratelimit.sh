#!/bin/bash

LOGFILE="test_ratelimit.log"
[ -f "$LOGFILE" ] && rm "$LOGFILE"

# Set the target URL (adjust if you're using a different port)
url="http://localhost:8080"

echo "=== Safe Test: Requests spaced 2 seconds apart ===" | tee -a "$LOGFILE"
for i in {1..5}; do
    response=$(curl -s -o /dev/null -w "%{http_code}" "$url")
    output="Safe Test - Request $i: Status Code - $response"
    echo "$output" | tee -a "$LOGFILE"
    sleep 2
done

echo "" | tee -a "$LOGFILE"

echo "=== Medium Test: Requests spaced 1 second apart ===" | tee -a "$LOGFILE"
for i in {1..5}; do
    response=$(curl -s -o /dev/null -w "%{http_code}" "$url")
    output="Medium Test - Request $i: Status Code - $response"
    echo "$output" | tee -a "$LOGFILE"
    sleep 1
done

echo "" | tee -a "$LOGFILE"

echo "=== Fast Test: Requests spaced 0.5 seconds apart ===" | tee -a "$LOGFILE"
for i in {1..5}; do
    response=$(curl -s -o /dev/null -w "%{http_code}" "$url")
    output="Fast Test - Request $i: Status Code - $response"
    echo "$output" | tee -a "$LOGFILE"
    sleep 0.5
done

echo "" | tee -a "$LOGFILE"

echo "=== Extra Fast Test: Requests spaced 0.2 seconds apart ===" | tee -a "$LOGFILE"
for i in {1..5}; do
    response=$(curl -s -o /dev/null -w "%{http_code}" "$url")
    output="Extra Fast Test - Request $i: Status Code - $response"
    echo "$output" | tee -a "$LOGFILE"
    sleep 0.2
done

echo "" | tee -a "$LOGFILE"
