return {
	no_consumer = false,
	fields = {
		set_request = {type = "boolean", default = true},
	},
	self_check = function(schema, plugin_t, dao, is_updating)
		return true
	end
}