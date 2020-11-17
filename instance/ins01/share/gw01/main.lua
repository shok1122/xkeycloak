local opts = {
    redirect_uri_path = "/srv01"
    discovery = "http://kc01:8080/auth/realms/master/.well-known/openid-configuration",
    client_id = "gw01",
    client_secret = "32ea6553-3b43-420d-8272-8188a84c4642",
}

local res, err = require('resty.openidc').authenticate(opts)

if err then
    ngx.status = 403
    ngx.say(err)
    ngx.exit(ngx.HTTP_FORBIDDEN)
end

