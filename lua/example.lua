#!/usr/bin/env lua
--
--------------------------------------------------------------------------------
--         FILE:  example.lua
--        USAGE:  ./example.lua 
--  DESCRIPTION:  an example lua script
--      OPTIONS:  ---
-- REQUIREMENTS:  ---
--         BUGS:  ---
--        NOTES:  ---
--       AUTHOR:   (), <>
--      COMPANY:  
--      VERSION:  1.0
--      CREATED:  2013/11/17 17时55分23秒 CST
--     REVISION:  ---
--------------------------------------------------------------------------------
--


function list_iter ( t )
    local i = 0
    local n = table.getn(t)
	return function( )
        i = i + 1
        if i <= n then return t[i] end 
    end
end  ----------  end of function list_iter  ----------
