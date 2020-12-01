-- print('.....' .. ngx.http_Authorization)
print('Hello World')

local tmp = ngx.var.http_Authorization
local _, _, access_token = string.find(tmp, "Bearer%s+(.*)")

print(">>> access_token: " .. access_token)

-- ngx.var.access_token = access_token

-- local res = ngx.location.capture('/auth_check', { vars = { access_token = access_token } })
-- local res = ngx.location.capture('/auth_check', {copy_all_vars = true})
-- local res = ngx.location.capture('/auth_check', {args = {token = access_token}})
local res = ngx.location.capture(
        '/auth_check',
        { body = "token="..access_token.."&token_type_hint=access_token&client_id=gw01&client_secret=32ea6553-3b43-420d-8272-8188a84c4642" }
    )

print(">>> status: " .. res.status)
print(">>> body: " .. res.body)

local cjson = require 'cjson'
local json_body = cjson.decode(res.body)
local is_active = json_body['active']
print(">>> active: " .. tostring(is_active))

if is_active ~= true then
    ngx.status = 403
    ngx.say(err)
    ngx.exit(ngx.HTTP_FORBIDDEN)
end

