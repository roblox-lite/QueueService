# QueueService
Simple queue system.

## Installation
**Method 1:** Copy the code in [`init.lua`](/init.lua). Then head over to `RobloxStudio` and make a `ModuleScript` in `ReplicatedStorage`. Past the code.

**Method 2:** Get the Roblox Model([Link To Model](https://www.roblox.com/library/8229899380/QueueService)). Import it to roblox using the ToolBox and move it to `ReplicatedStorage`

## Example Use cases
* Datastore System
* Music System
* Limiter
* HttpService Wrapper
* Multi Queue System
* Animation System
* Handle Lag

## Basic Usage
```lua
--> Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")

--> Variables
local QueueService = require(ReplicatedStorage:FindFirstChild("QueueService"))
local MyQueue = QueueService.New("MyQueue", 5, false)

--> Functions
MyQueue:Add(function()
	print("New Item Added to Queue!")
end)

MyQueue:Run()
```
## Using `Queue.New`
This function initiates the queue, the arguments you need to pass are the `Queue Name`, `Refresh Rate`, and if the queue should `Bulk Run`.
```lua
local MyQueue = QueueService.New("MyQueue", 5, false)
```

## Using `Queue.Fetch`
This function lets you use the same queue in multiple scripts. The only argument you pass through is the queues `Name`.
```lua
local MyQueue = QueueService.Fetch("MyQueue")
```

## Using `Add`
This function simply adds a item to your queue.
```lua
MyQueue:Add(function()
	print("New Item Added to Queue!")
end)
```

## Using `Run`
This function simply runs the queue according to the refresh rate that was passed through.
```lua
MyQueue:Run()
```

## Using `Clear`
This function simply clears the current queue, the only argument that is passed in determines whether if the remaining functions of the queue should run at once or just simply clear it.
```lua
MyQueue:Clear(false)
```

## Using `Pause`
This function simply pauses the current queue.
```lua
MyQueue:Pause()
```

## Using `Resume`
This function simply resumes the current queue.
```lua
MyQueue:Resume()
```

# Contact
Via `@Twitter`: [workframes](https://twitter.com/workframes) <br />
Via `@Discord`: frames#4888
