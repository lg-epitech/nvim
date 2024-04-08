LAZY_PLUGIN_SPEC = {}

function spec(item)
	table.insert(LAZY_PLUGIN_SPEC, { import = item })
end

function spec_list(file_path)
    local plugin_list = require(file_path)

    for _, plugin in pairs(plugin_list) do
        table.insert(LAZY_PLUGIN_SPEC, plugin)
    end
end
