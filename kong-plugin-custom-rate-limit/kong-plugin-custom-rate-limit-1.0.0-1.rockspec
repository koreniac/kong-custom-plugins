package = "kong-plugin-custom-rate-limit"
version = "1.0.0-1"
source = {
   url = "git+https://git.chaomy.com/api-service/kong-custom-plugins",
   tag = "v1.0"
}
description = {
   summary = "A Kong plugin to do rate limit via uid",
   homepage = "https://git.chaomy.com/api-service/kong-custom-plugins",
   license = "MIT"
}
dependencies = {
}
build = {
   type = "builtin",
   modules = {
      ["kong.plugins.custom-rate-limit.schema"] = "schema.lua",
      ["kong.plugins.custom-rate-limit.handler"] = "handler.lua",
      ["kong.plugins.custom-rate-limit.daos"] = "daos.lua",
      ["kong.plugins.custom-rate-limit.policies.cluster"] = "policies/cluster.lua",
      ["kong.plugins.custom-rate-limit.policies.init"] = "policies/init.lua",
      ["kong.plugins.custom-rate-limit.migrations.postgres"] = "migrations/postgres.lua",
      ["kong.plugins.custom-rate-limit.migrations.cassandra"] = "migrations/cassandra.lua",

   }
}