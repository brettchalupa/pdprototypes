util = {}

function util.isFunction(variable)
    return type(variable) == "function"
end

function util.clamp(value, min, max)
	return math.max(math.min(value, max), min)
end
