## Usage
- Download to your kong apigateway.
- Cd the directory.

```
cd /your/path/to/kong-plugin-req-uuid/
```

- luarocks

```
luarocks make
```

- Add it in your kong conf.

```
export KONG_CUSTOM_PLUGIN=req-uuid
```

or set in `kong.conf`

```
custom_plugins = req-uuid 
```

- Use it for your api

```
curl -X POST http://localhost:8001/apis/api/plugins --data 'name=req-uuid'
```


Conf | Default | Description |
---|---|---
set_request | true | set uuid in request's header
