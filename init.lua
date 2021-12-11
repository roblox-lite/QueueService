--[=[
    @TODO: 
]=]

--> Variables
local Queue = {}
Queue.RunningQueues = {}
Queue.__index = Queue.RunningQueues

--> Functions
function Queue.New(Name : string, RefreshRate : number, MassRun : boolean)
	assert(type(Name) == "string", "Argument #1 of Queue.New must be a string.")
	assert(type(RefreshRate) == "number", "Argument #2 of Queue.New must be a number.")
	assert(type(MassRun) == "boolean", "Argument #3 of Queue.New must be a boolean.")

	local self = {
		Name = Name,
		Queue = {},
		RefreshRate = RefreshRate,
		MassRun = MassRun,
	}

	return setmetatable(self, Queue)
end

function Queue.RunningQueues:Add(Function : any)
	assert(type(Function) == "function", "Argument #1 of Queue:Add must be a function.")

	return table.insert(self.Queue, Function)
end

function Queue.RunningQueues:Run()
	coroutine.wrap(function()
		while(task.wait(self.RefreshRate))do
			print(self.Queue)
			if(#self.Queue > 0)then
				if(self.MassRun)then
					for Key, Value in pairs(self.Queue)do
						Value()
						self.Queue[Key] = nil
					end
				elseif not(self.MassRun)then
					local Key, Value = next(self.Queue)
					Value()
					self.Queue[Key] = nil
				end
			end
		end
	end)()
end

return Queue
