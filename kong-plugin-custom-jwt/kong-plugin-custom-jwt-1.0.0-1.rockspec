package = "kong-plugin-custom-jwt"
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
}
build = {
   type = "builtin",
   modules = {
      ["kong.plugins.custom-jwt.schema"] = "schema.lua",
      ["kong.plugins.custom-jwt.jwt_parser"] = "jwt_parser.lua",
      ["kong.plugins.custom-jwt.handler"] = "handler.lua",
      ["kong.plugins.custom-jwt.daos"] = "daos.lua",
      ["kong.plugins.custom-jwt.asn_sequence"] = "asn_sequence.lua",
      ["kong.plugins.custom-jwt.api"] = "api.lua",
      ["kong.plugins.custom-jwt.migrations.postgres"] = "migrations/postgres.lua",
      ["kong.plugins.custom-jwt.migrations.cassandra"] = "migrations/cassandra.lua",

   }
}