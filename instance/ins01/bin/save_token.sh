user_id="$1"
client_id="$2"
realm="$3"

user_pass=$(yq r conf.d/${user_id}.yaml password)
client_secret=$(yq r conf.d/${user_id}.yaml ${client_id}.secret)

echo '================================================================='
echo " -  user_id:       $user_id"
echo " -  user_pass:     $user_pass"
echo " -  cliend_id:     $client_id"
echo " -  client_secret: $client_secret"
echo " -  realm:         $realm"
echo '================================================================='

access_token=$(curl "http://xkeycloak:8080/auth/realms/${realm}/protocol/openid-connect/token" \
    -s \
    -X POST \
    -d "grant_type=password" \
    -d "client_id=${client_id}" \
    -d "client_secret=${client_secret}" \
    -d "username=${user_id}" \
    -d "password=${user_pass}" \
    -d "scope=openid" \
    | jq .access_token \
    | awk -F \" '{print $2}')

echo $access_token
echo $access_token > /tmp/${user_id}.${client_id}.${realm}.access_token

