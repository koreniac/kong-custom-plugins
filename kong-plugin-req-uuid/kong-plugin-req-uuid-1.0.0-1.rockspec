package = "kong-plugin-req-uuid"
version = "1.0.0-1"
source = {
   url = "git+https://git.chaomy.com/api-service/kong-custom-plugins",
   tag = "v1.0"
}
description = {
   summary = "A Kong plugin to set uuid in every request's header",
   homepage = "https://git.chaomy.com/api-service/kong-custom-plugins",
   license = "MIT"
}
dependencies = {
    "lua-resty-jit-uuid >= 0.0.5"
}
build = {
   type = "builtin",
   modules = {
      ["kong.plugins.req-uuid.handler"] = "handler.lua",
      ["kong.plugins.req-uuid.schema"] = "schema.lua",
   }
}