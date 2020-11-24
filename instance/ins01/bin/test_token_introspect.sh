user_id="$1"
client_id="$2"
realm="$3"

echo '================================================================='
echo " -  user_id:   $user_id"
echo " -  cliend_id: $client_id"
echo " -  realm:     $realm"
echo '================================================================='

access_token=$(cat /tmp/${user_id}.${client_id}.${realm}.access_token)

curl http://xkeycloak/token_introspect/${realm} \
    -X POST \
    -H "Content-Type: application/x-www-form-urlencoded" \
    -d "token=${access_token}" \
    -d "token_type_hint=access_token" \
    -d "client_id=gw01" \
    -d "client_secret=32ea6553-3b43-420d-8272-8188a84c4642" \

