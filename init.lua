local Maybe
do
  local _class_0
  local _base_0 = {
    isPresent = function(self)
      return self.Present
    end,
    isEmpty = function(self)
      return not self.Present
    end,
    get = function(self)
      assert(self.Present, 'maybe: get called on None')
      return self.Value
    end
  }
  _base_0.__index = _base_0
  _class_0 = setmetatable({
    __init = function(self, Value, Present)
      self.Value, self.Present = Value, Present
      if self.Present then
        return assert(self.Value ~= nil, 'Just<T> cannot be nil!')
      end
    end,
    __base = _base_0,
    __name = "Maybe"
  }, {
    __index = _base_0,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  local self = _class_0
  self.Just = function(Value)
    return Maybe(Value, true)
  end
  self.None = function()
    return Maybe(nil, false)
  end
  self.Exists = function(Value)
    return Maybe(Value, Value ~= nil)
  end
  self.Truthy = function(Value)
    return Maybe(Value, Value and true)
  end
  self.Array = function(Array)
    return Maybe(Value, #Array > 0)
  end
  self.Call = function(Fn, ...)
    return Maybe.Exists(Fn(...))
  end
  Maybe = _class_0
  return _class_0
end
