-- maybe.moon
-- SFZILabs 2021

-- Maybe<T> = Just<T> | None
class Maybe
	new: (@Value, @Present) =>
		if @Present
			assert @Value != nil, 'Just<T> cannot be nil!'

	isPresent: => @Present
	isEmpty: => not @Present
	get: =>
		assert @Present, 'maybe: get called on None' 		
		@Value

	@Just: (Value) -> Maybe Value, true
	@None: -> Maybe nil, false
	@Exists: (Value) -> Maybe Value, Value != nil
	@Truthy: (Value) -> Maybe Value, Value and true
	@Array: (Array) -> Maybe Value, #Array > 0
	@Call: (Fn, ...) -> Maybe.Exists Fn ...
