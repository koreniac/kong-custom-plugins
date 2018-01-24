# README
Some custom kong plugins.

## Plugins

#### kong-plugin-req-uuid
Functions:
1. Add the `uuid` in every request's header.
2. Add the `uid` in request's header if the jwt contains.

#### kong-plugin-custom-jwt
Functions:
1. Basic functions provided by kong's plugin [jwt](https://getkong.org/plugins/jwt/?_ga=2.5724087.585069100.1516780342-1118527924.1515371399).
2. Add the `uid` in jwt's body to the `ngx.ctx`.
3. Verify the `scopes` in jwt's body with the request uri, if the user donnot have the permission, then return with http status `403`.


New Parameter | Default | Description 
---|---|---
`uid_claim_name` | `uid` | The plugin will search the name in jwt's body to get `uid`.
`scopes_claim_name` | `scopes` | The plugin will search the name in jwt's body to get `scopes`.

#### kong-plugin-custom-rate-limit
Functions
1. Basic functions provided by kong's plugin [rate-limiting](https://getkong.org/plugins/rate-limiting/?_ga=2.243176198.585069100.1516780342-1118527924.1515371399).
2. Now the plugin can do rate-limiting via the `uid` set in the `ngx.ctx`.

New Parameter | Default | Description 
---|---|---
`config.limit_by` | `uid` | Default limit by `uid` now, you can still choose `consumer`, `credential` or `ip`. If the `uid`, `consumer` or `credential` cannot be determined, it will fallback to `ip`.


## Usage

- Download.

```
git clone git@github.com:LonelyOrion/kong-custom-plugins.git
```

- Install each plugin.

```
$ cd kong-custom-plugins/
$ cd kong-plugin-req-uuid/
$ luarocks make
$ cd ../kong-plugin-custom-jwt/
$ luarocks make
$ cd ../kong-plugin-custom-rate-limit/
$ luarocks make
```

- Enable the plugins in your conf. 

```
export KONG_CUSTOM_PLUGIN=req-uuid,custom-jwt,custom-rate-limit
```

or set in `kong.conf`

```
custom_plugins=req-uuid,custom-jwt,custom-rate-limit
```

- Start kong.

```
$ (sudo) kong migrations up -c kong.conf
$ (sudo) kong start -c kong.conf
```

- Use it in your api. 


## Known issues
- Cannot find lua openssl when use `kong migrations up` or `kong start`

    Solutions:

```
$ luarocks install luaossl
```
- Cannot find LuaRocks `kong.dao.migrations.helpers` when use `kong migrations up` or `kong start`

    Solutions:
    
```
1. Get the file
https://github.com/Kong/kong/blob/master/kong/dao/migrations/helpers.lua

2. Move it to your kong folder
example: /usr/local/share/lua/5.1/kong/dao/migrations (ubuntu 16.04)
```
