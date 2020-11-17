-- print('.....' .. ngx.http_Authorization)
print('Hello World')

local h = ngx.req.get_headers()

print('>>> authorization: ' .. h['authorization'])

local _, _, access_token = string.find(h['authorization'], "Bearer%s+(.*)")

print(">>> access_token: " .. access_token)

ngx.var.access_token = access_token

local res = ngx.location.capture('/auth_check')

print(">>> status: " .. res.status)
print(">>> body: " .. res.body)

local cjson = require 'cjson'
local json_body = cjson.decode(res.body)
local is_active = json_body['active']
print(">>> active: " .. tostring(is_active))

if is_active == false then
    ngx.status = 403
    ngx.say(err)
    ngx.exit(ngx.HTTP_FORBIDDEN)
end

