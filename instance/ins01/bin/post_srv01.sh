
access_token=$(cat /tmp/access_token)

curl -H "Authorization: Bearer $access_token" http://xkeycloak/srv01/

