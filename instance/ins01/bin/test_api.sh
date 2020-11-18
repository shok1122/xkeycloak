user_id="$1"
client_id="$2"
realm="$3"
path="$4"

echo '================================================================='
echo " -  user_id:   $user_id"
echo " -  cliend_id: $client_id"
echo " -  realm:     $realm"
echo " -  path:      $path"
echo '================================================================='

access_token=$(cat /tmp/${user_id}.${client_id}.${realm}.access_token)

curl -H "Authorization: Bearer $access_token" http://xkeycloak/${path}

