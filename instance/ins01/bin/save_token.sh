access_token=$(curl "http://xkeycloak:8080/auth/realms/srv01/protocol/openid-connect/token" \
    -s \
    -X POST \
    -d "grant_type=password" \
    -d "client_id=app01" \
    -d "client_secret=13d18d5a-4b2d-4f02-964e-9a6b9a5d3bdb" \
    -d "username=user01" \
    -d "password=pass" \
    -d "scope=openid" \
    | jq .access_token \
    | awk -F \" '{print $2}')

echo $access_token > /tmp/access_token

