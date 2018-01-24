local BasePlugin = require "kong.plugins.base_plugin"
local uuid = require "resty.jit-uuid"

local ReqUUIDHandler = BasePlugin:extend()

function ReqUUIDHandler:new()
  ReqUUIDHandler.super.new(self, "req-uuid")
end

function ReqUUIDHandler:access(conf)
  ReqUUIDHandler.super.access(self)

  uuid.seed()
  if conf.set_request then
    ngx.req.set_header("uuid", uuid())
    if ngx.ctx.uid then 
      ngx.req.set_header("uid", ngx.ctx.uid)
    end
  end
end

ReqUUIDHandler.PRIORITY = 805
ReqUUIDHandler.VERSION = "1.0.0"

return ReqUUIDHandler
