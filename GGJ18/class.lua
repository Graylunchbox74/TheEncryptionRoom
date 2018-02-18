function class(c)
	c = setmetatable(c, {
		-- This is called when we try to make a new instance of the class
		__call = function(_, ...)
			-- We get "two" parameters: the table this metatable is controlling, aka c
			-- and a list of parameters that were passed in to the constructor

			-- We create an empty object that will store all of our instance variables
			local obj = {}

			-- If this class has a constructor, we initalize the object by calling the constructor	
			if c.new then
				c.new(obj, ...)
			end

			-- This is important, we tell the obj(ect) to look in the table c if it cannot find
			-- something in itself. This allows many instance objects to "point" to the main
			-- class table if they don't have something.
			setmetatable(obj, { __index = c })

			-- We return the object we created
			return obj
		end
	})

	return c
end
