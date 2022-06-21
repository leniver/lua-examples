-- ################################################################################
-- #                  Copyright 2014-2022 Novaquark SAS                           #
-- ################################################################################

-----------------------------------------------------------------------------------
-- Industry
--
-- An industry is a machine designed to produce different types of elements
-----------------------------------------------------------------------------------

require("element")

--- An industry is a machine designed to produce different types of elements
---@class Industry
Industry = {}
Industry.__index = Industry
function Industry()
    local self = Element()

    --- Start the production, and it will run unless it is stopped or the input resources run out
    function self.startRun() end
    ---@deprecated Industry.start() is deprecated, use Industry.startRun() instead.
    function self.start() error("Industry.start() is deprecated, use Industry.startRun() instead.") end

    --- Start maintaining the specified quantity. Resumes production when the quantity in the output Container is too low, and pauses production when it is equal or higher
    ---@param quantity integer Quantity to maintain inside output containers
    function self.startMaintain(quantity) end
    ---@deprecated Industry.startAndMaintain(quantity) is deprecated, use Industry.startMaintain(quantity) instead.
    function self.startAndMaintain(quantity) error("Industry.startAndMaintain(quantity) is deprecated, use Industry.startMaintain(quantity) instead.") end

    --- Start the production of numBatches and then stop
    ---@param numBatches integer Number of batches to run before unit stops
    function self.startFor(numBatches) end
    ---@deprecated Industry.batchStart(quantity) is deprecated, use Industry.startFor(numBatches) instead.
    function self.batchStart(numBatches) error("Industry.batchStart(quantity) is deprecated, use Industry.startFor(numBatches).") end

    --- Stop the production of the industry unit
    ---@param force boolean (optional by default false) True if you want to force the production to stop immediately
    ---@param allowLoss boolean (optional by default false) True if you want to allow the industry unit to lose components when recovering in use components
    function self.stop(force,allowLoss) end
    ---@deprecated Industry.hardStop(allowLoss) is deprecated, use Industry.stop(true,allowLoss) instead.
    function self.hardStop(allowLoss) error("Industry.hardStop(allowLoss) is deprecated, use Industry.stop(true,allowLoss) instead.") end
    ---@deprecated Industry.softStop() is deprecated, use Industry.stop(false,false) instead.
    function self.softStop() error("Industry.softStop() is deprecated, use Industry.stop(false,false) instead.") end

    --- Get the current running state of the industry
    ---@return integer value (Stopped = 1, Running = 2, Jammed missing ingredient = 3, Jammed output full = 4, Jammed no output container = 5, Pending = 6)
    function self.getStatus() end

    --- Get the complete state of the industry
    ---@return integer value The complete state of the industry, a table with fields {[int] state, [bool] stopRequested, [int] schematicId, [int] unitsProduced, [int] remainingTime, [int] batchesRequested, [int] batchesRemaining, [float] maintainProductAmount, [int] currentProductAmount}
    function self.getState() end

    --- Get the count of completed cycles since the player started the unit
    ---@return integer
    function self.getCyclesCompleted() end
    ---@deprecated Industry.getCycleCountSinceStartup() is deprecated, use Industry.getCyclesCompleted() instead.
    function self.getCycleCountSinceStartup() error("Industry.getCycleCountSinceStartup() is deprecated, use Industry.getCyclesCompleted() instead.") end

    --- Returns the efficiency of the industry
    ---@return number
    function self.getEfficiency() end

    --- Returns the time elapsed in seconds since the player started the unit for the latest time
    ---@return number
    function self.getUptime() end

    --- Get the id of the currently loaded Schematic
    ---@return integer
    function self.getCurrentSchematic() end

    --- Set the loaded Schematic, based on its id. Use getCurrentSchematic to learn about your Schematic id
    ---@param id integer The Schematic id to be loaded
    function self.setCurrentSchematic(id) end


    --- Emitted when the Industry Unit has started a new production process
    ---@param id integer The product item id
    ---@param quantity number The product quantity
    self.onStarted = Event:new()

    --- Emitted when the Industry Unit has completed a run
    ---@param id integer The product item id
    ---@param quantity number The product quantity
    self.onCompleted = Event:new()
    self.completed = Event:new()
    self.completed:addAction(function(self,id,quantity) error("Industry.completed() event is deprecated, use Industry.onCompleted(id,quantity) instead.") end, true, 1)
    
    --- Emitted when the industry status has changed
    ---@param status integer The status of the industry can be (Stopped = 1, Running = 2, Jammed missing ingredient = 3, Jammed output full = 4, Jammed no output container = 5, Pending = 6)
    self.onStatusChanged = Event:new()
    self.statusChanged = Event:new()
    self.statusChanged:addAction(function(self) error("Industry.statusChanged(status) event is deprecated, use Industry.onStatusChanged(status) instead.") end, true, 1)


    return setmetatable(self, Industry)
end