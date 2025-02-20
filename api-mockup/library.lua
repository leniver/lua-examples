-- ################################################################################
-- #                  Copyright 2014-2022 Novaquark SAS                           #
-- ################################################################################

-----------------------------------------------------------------------------------
-- Library
--
-- Contains a list of useful math and helper methods that would be slow to implement in Lua, and which are
-- given here as fast C++ implementation.
-----------------------------------------------------------------------------------


--- Contains a list of useful math and helper methods that would be slow to implement in Lua, and which are
--- given here as fast C++ implementation.
---@class Library
Library = {}
Library.__index = Library
function Library()
    local self = {}


    --- Solve the 3D linear system M*x=c0 where M is defined by its column vectors c1,c2,c3
    ---@param c1 Vector3 The first column of the matrix M
    ---@param c2 Vector3 The second column of the matrix M
    ---@param c3 Vector3 The third column of the matrix M
    ---@param c0 Vector3 The target column vector of the system
    ---@return Vector3 value The vec3 solution of the above system
    function self.systemResolution3(c1,c2,c3,c0) end

    --- Solve the 2D linear system M*x=c0 where M is defined by its column vectors c1,c2
    ---@param c1 Vector3 The first column of the matrix M
    ---@param c2 Vector3 The second column of the matrix M
    ---@param c0 Vector3 The target column vector of the system
    ---@return vector2 value The vec2 solution of the above system
    function self.systemResolution2(c1,c2,c0) end

    --- Returns the position of the given point in world coordinates system, on the game screen
    ---@param worldPos Vector3: The world position of the point
    ---@return Vector3 value The position in percentage (between 0 and 1) of the screen resolution as vec3 with {x, y, depth}
    function self.getPointOnScreen(worldPos) end


    return setmetatable(self, Library)
end

--- Global alias available out of the game
DULibrary = Library
