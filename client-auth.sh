#!/bin/bash

# Load environment variables from .env file
if [ -f .env ]; then
    export $(cat .env | grep -v '^#' | xargs)
else
    echo "Error: .env file not found!"
    exit 1
fi

# Create a realm named Demo
# Create a client named demo-client-001 with the following settings:
# Create a user named demo01 with the following settings:
# - username: demo01
# - password: (loaded from .env)
# - email: demo01@example.com

# Get the token response
RESPONSE=$(curl -s -d "client_id=${CLIENT_ID}" -d "client_secret=${CLIENT_SECRET}" -d "username=${USERNAME}" -d "password=${PASSWORD}" -d "grant_type=password" "${KEYCLOAK_URL}/realms/${REALM}/protocol/openid-connect/token")

# Extract access_token from JSON response
ACCESS_TOKEN=$(echo "$RESPONSE" | jq -r '.access_token')

echo "Full response:"
echo "$RESPONSE" | jq '.'

echo -e "\nAccess Token:"
echo "$ACCESS_TOKEN"

# Decode JWT token (access tokens are typically JWT format)
if [ "$ACCESS_TOKEN" != "null" ] && [ -n "$ACCESS_TOKEN" ]; then
    #echo -e "\nDecoded JWT Header:"
    #echo "$ACCESS_TOKEN" | cut -d'.' -f1 | base64 -d 2>/dev/null | jq '.' 2>/dev/null || echo "Failed to decode header"
    
    echo -e "\nDecoded JWT Payload:"
    echo "$ACCESS_TOKEN" | cut -d'.' -f2 | base64 -d 2>/dev/null | jq '.' 2>/dev/null || echo "Failed to decode payload"
    
    #echo -e "\nJWT Signature (base64url encoded):"
    #echo "$ACCESS_TOKEN" | cut -d'.' -f3
else
    echo "No access token found in response"
fi