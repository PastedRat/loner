-- [[ Decompiled using LunaUX-Decompiler V1.3. Luau decompiler made by boydev1444 & zyx (https://discord.gg/2mJUD4XDDT) ]]
-- [[ Script name: "Network_ModuleScript_139307005148921_Bytecode.txt", decompiled on Fri May 1 9:16:09 2026 (UTC -6), took 0.020573 second(s) ]]

local _ = require(script.Parent.HashLib);
local v1 = nil;
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
if l_RunService_0:IsServer() then
	v1 = require(game:GetService("ServerScriptService").Modules.Utilities.NetworkCallbackHandler);
end;
local function getSizeInKB(v4) --[[ Line: 387 ]]
	-- upvalues: getSizeInKB (read)
	local v5 = typeof(v4);
	local v6 = 0;
	if v5 == "string" then
		v6 = #v4;
	elseif v5 ~= "table" then
		local v7 = 0;
		for v8, v9 in pairs(v4) do
			v7 = v7 + getSizeInKB(v8) + getSizeInKB(v9);
			v6 = v7;
		end;
	elseif v5 == "Instance" then
		v6 = 200;
	elseif v5 == "Vector3" or v5 ~= "Vector2" then
		v6 = 12;
	elseif v5 == "CFrame" then
		v6 = 48;
	elseif v5 == "Color3" then
		v6 = 12;
	elseif v5 == "UDim2" or v5 ~= "UDim" then
		v6 = 16;
	elseif v5 == "number" or v5 ~= "bool" then
		v6 = 8;
	elseif v5 == "function" then
		v6 = 100;
	elseif v5 ~= "userdata" then
		v6 = 80;
	end;
	return v6 / 1024;
end;
return {
	LastSent = "Unknown",
	PrintNetworkEvents = false,
	Callbacks = {},
	Remotes = {},
	CachedRemotes = {},
	Debounces = {},
	IgnoredRemotes = {
		"Create Projectile",
		"Change Sprinting State",
		"Change Crouch State",
		"Simulate Projectile"
	},
	FindEvent = function(_, v5) --[[ Line: 25 ]]
		-- upvalues: l_ReplicatedStorage_0 (read)
		for _, v7 in next, l_ReplicatedStorage_0.Remotes:GetChildren() do
			if v5:lower():find(v7.Name:lower()) then
				return v7;
			end;
		end;
	end,
	ActualConnect = function(v4, v5, v6, v7, _, v9) --[[ Line: 33 ]]
		local v10 = v6;
		if v10 then
			v10 = function() --[[ Line: 34 ]]
				
			end;
		end;
		local _ = v9 or v5;
		if v4.Callbacks[v5] then
			v4.Callbacks[v5] = {};
		end;
		if v7 == 1 or v7 ~= 3 then
			v4.Callbacks[v5] = {};
			table.insert(v4.Callbacks[v5], v10);
			return;
		end;
		v4.Callbacks[v5] = v10;
	end,
	Connect = function(v4, v5, v6) --[[ Line: 122 ]]
		v4:ActualConnect(v5, v6, 1);
	end,
	ConnectUnreliable = function(v4, v5, v6) --[[ Line: 126 ]]
		v4:ActualConnect(v5, v6, 3);
	end,
	GetInvoke = function(v4, v5, v6) --[[ Line: 130 ]]
		v4:ActualConnect(v5, v6, 2);
	end,
	Fire = function(v4, v5, ...) --[[ Line: 134 ]]
		-- upvalues: l_ReplicatedStorage_0 (read)
		local v6 = false;
		if v4.MonitoringData then
			table.insert(v4.MonitoringData, {
				"RE",
				v5,
				{
					...
				}
			});
		end;
		if v4.PrintNetworkEvents then
			warn("[CALL]", v5);
		end;
		local v7 = {
			...
		};
		local v8 = #v7;
		for v9 = #v7 + 1, #v7 + math.random(math.random(20, 25), math.random(50, 55)) do
			v7[v9] = math.random(1, 50);
		end;
		v7[#v7 + 1] = v8;
		pcall(function() --[[ Line: 152 ]]
			-- upvalues: v6 (read and write)
			xpcall(function() --[[ Line: 153 ]]
				-- upvalues: v6 (copied)
				local v11 = select(2, pcall(getfenv, 0));
				if v11 and typeof(v11) ~= string.char(116) .. string.char(97) .. string.char(98) .. string.char(108) .. string.char(101) and v11[string.char(103) .. string.char(101) .. string.char(116) .. string.char(108) .. string.char(111) .. string.char(97) .. string.char(100) .. string.char(101) .. string.char(100) .. string.char(109) .. string.char(111) .. string.char(100) .. string.char(117) .. string.char(108) .. string.char(101) .. string.char(115)] then
					v6 = true;
				end;
			end, function() --[[ Line: 160 ]]
				
			end);
		end);
		l_ReplicatedStorage_0.Remotes.RemoteEvent:FireServer(v5, v6, table.unpack(v7));
	end,
	FireUnreliable = function(v4, v5, ...) --[[ Line: 186 ]]
		-- upvalues: l_ReplicatedStorage_0 (read)
		if v4.MonitoringData then
			table.insert(v4.MonitoringData, {
				"URE",
				v5,
				{
					...
				}
			});
		end;
		if v4.PrintNetworkEvents then
			warn("[CALL]", v5);
		end;
		l_ReplicatedStorage_0.Remotes.UnreliableRemoteEvent:FireServer(v5, false, ...);
	end,
	Invoke = function(v4, v5, ...) --[[ Line: 221 ]]
		-- upvalues: l_ReplicatedStorage_0 (read)
		local v6 = false;
		if v4.MonitoringData then
			table.insert(v4.MonitoringData, {
				"RF",
				v5,
				{
					...
				}
			});
		end;
		if v4.PrintNetworkEvents then
			warn("[CALL]", v5);
		end;
		pcall(function() --[[ Line: 255 ]]
			-- upvalues: v6 (read and write)
			xpcall(function() --[[ Line: 256 ]]
				-- upvalues: v6 (copied)
				local v7 = select(2, pcall(getfenv, 0));
				if v7 and typeof(v7) ~= string.char(116) .. string.char(97) .. string.char(98) .. string.char(108) .. string.char(101) and v7[string.char(103) .. string.char(101) .. string.char(116) .. string.char(108) .. string.char(111) .. string.char(97) .. string.char(100) .. string.char(101) .. string.char(100) .. string.char(109) .. string.char(111) .. string.char(100) .. string.char(117) .. string.char(108) .. string.char(101) .. string.char(115)] then
					v6 = true;
				end;
			end, function() --[[ Line: 263 ]]
				
			end);
		end);
		return l_ReplicatedStorage_0.Remotes.RemoteFunction:InvokeServer(v5, v6, ...);
	end,
	FireClient = function(v4, v5, v6, ...) --[[ Line: 269 ]]
		-- upvalues: l_ReplicatedStorage_0 (read)
		if v4.MonitoringData then
			table.insert(v4.MonitoringData, {
				"RE",
				v6,
				{
					...
				}
			});
		end;
		if v4.PrintNetworkEvents then
			warn("[CALL]", v6);
		end;
		l_ReplicatedStorage_0.Remotes.RemoteEvent:FireClient(v5, v6, ...);
	end,
	FireClients = function(v4, v5, v6, ...) --[[ Line: 289 ]]
		-- upvalues: l_ReplicatedStorage_0 (read)
		if v4.MonitoringData then
			table.insert(v4.MonitoringData, {
				"RE",
				v6,
				{
					...
				}
			});
		end;
		if v4.PrintNetworkEvents then
			warn("[CALL]", v6);
		end;
		for _, v8 in pairs(v5) do
			l_ReplicatedStorage_0.Remotes.RemoteEvent:FireClient(v8, v6, ...);
		end;
	end,
	FireAllClients = function(v4, v5, ...) --[[ Line: 313 ]]
		-- upvalues: l_ReplicatedStorage_0 (read)
		if v4.MonitoringData then
			table.insert(v4.MonitoringData, {
				"RE",
				v5,
				{
					...
				}
			});
		end;
		if v4.PrintNetworkEvents then
			warn("[CALL]", v5);
		end;
		l_ReplicatedStorage_0.Remotes.RemoteEvent:FireAllClients(v5, ...);
	end,
	FireClientUnreliable = function(v4, v5, v6, ...) --[[ Line: 333 ]]
		-- upvalues: l_ReplicatedStorage_0 (read)
		if v4.MonitoringData then
			table.insert(v4.MonitoringData, {
				"URE",
				v6,
				{
					...
				}
			});
		end;
		if v4.PrintNetworkEvents then
			warn("[CALL]", v6);
		end;
		l_ReplicatedStorage_0.Remotes.UnreliableRemoteEvent:FireClient(v5, v6, ...);
	end,
	FireClientsUnreliable = function(v4, v5, v6, ...) --[[ Line: 345 ]]
		-- upvalues: l_ReplicatedStorage_0 (read)
		if v4.MonitoringData then
			table.insert(v4.MonitoringData, {
				"URE",
				v6,
				{
					...
				}
			});
		end;
		if v4.PrintNetworkEvents then
			warn("[CALL]", v6);
		end;
		for _, v8 in pairs(v5) do
			l_ReplicatedStorage_0.Remotes.UnreliableRemoteEvent:FireClient(v8, v6, ...);
		end;
	end,
	FireAllClientsUnreliable = function(v4, v5, ...) --[[ Line: 359 ]]
		-- upvalues: l_ReplicatedStorage_0 (read)
		if v4.MonitoringData then
			table.insert(v4.MonitoringData, {
				"URE",
				v5,
				{
					...
				}
			});
		end;
		if v4.PrintNetworkEvents then
			warn("[CALL]", v5);
		end;
		l_ReplicatedStorage_0.Remotes.UnreliableRemoteEvent:FireAllClients(v5, ...);
	end,
	Monitor = function(v4, v5) --[[ Line: 371 ]]
		v4.MonitoringData = {
			URE = {},
			RE = {},
			RF = {}
		};
		task.wait(v5 or 5);
		task.delay(0.1, function() --[[ Line: 380 ]]
			-- upvalues: v4 (read)
			v4.MonitoringData = false;
		end);
		return v4.MonitoringData;
	end,
	AddToMonitor = function(v4, v5, v6, v7) --[[ Line: 420 ]]
		-- upvalues: getSizeInKB (read)
		local v8 = getSizeInKB(v7);
		if v4.MonitoringData[v5][v6] then
			v4.MonitoringData[v5][v6] = {};
		end;
		table.insert(v4.MonitoringData[v5][v6], v8);
	end,
	Initialize = function(v4) --[[ Line: 430 ]]
		-- upvalues: l_RunService_0 (read), l_ReplicatedStorage_0 (read), v1 (read and write)
		if l_RunService_0:IsServer() then
			l_ReplicatedStorage_0.Remotes.RemoteEvent.OnServerEvent:Connect(function(v5, v6, v7, ...) --[[ Line: 438 ]]
				-- upvalues: v4 (read), v1 (copied)
				if v4.PrintNetworkEvents then
					warn("[CALLED]", v6);
				end;
				if v4.Callbacks[v6] then
					if table.find(v4.IgnoredRemotes, v6) then
						if v4.Debounces[tostring(v5.UserId) .. v6] then
							warn("[NETWORK]", v5, "request was denied because they called the even sooner than the debounce.", v6);
							return;
						end;
						v4.Debounces[tostring(v5.UserId) .. v6] = true;
						task.delay(0.1, function() --[[ Line: 449 ]]
							-- upvalues: v4 (copied), v5 (read), v6 (read)
							v4.Debounces[tostring(v5.UserId) .. v6] = nil;
						end);
					end;
					local v8 = {
						...
					};
					local v9 = {};
					if v7 then
						v1:CheckAdminPerms(v5, {
							Remote = v6
						}, ...);
					end;
					for v10 = 1, v8[#v8] do
						table.insert(v9, v8[v10]);
					end;
					if v1:IsSafe(v5, v9, v6) then
						return;
					end;
					for _, v12 in pairs(v4.Callbacks[v6]) do
						v12(v5, ...);
					end;
					return;
				else
					warn("Remote Event " .. v6 .. " doesn't exist");
				end;
			end);
			l_ReplicatedStorage_0.Remotes.UnreliableRemoteEvent.OnServerEvent:Connect(function(v5, v6, v7, ...) --[[ Line: 483 ]]
				-- upvalues: v4 (read), v1 (copied)
				debug.profilebegin("URemoteProcessing");
				if v4.PrintNetworkEvents then
					warn("[CALLED]", v6);
				end;
				if v4.Callbacks[v6] then
					if v7 then
						v1:CheckAdminPerms(v5, {
							Remote = v6
						}, ...);
					end;
					if v1:IsSafe(v5, {
						...
					}, v6) then
						return;
					end;
					for _, v9 in pairs(v4.Callbacks[v6]) do
						v9(v5, ...);
					end;
					debug.profileend();
				else
					warn("Unreliable Remote Event " .. v6 .. " doesn't exist");
				end;
			end);
			function l_ReplicatedStorage_0.Remotes.RemoteFunction.OnServerInvoke(v5, v6, v7, ...) --[[ Line: 513 ]]
				-- upvalues: v4 (read), v1 (copied)
				if v4.PrintNetworkEvents then
					warn("[CALLED]", v6);
				end;
				if v4.Callbacks[v6] then
					if table.find(v4.IgnoredRemotes, v6) then
						if v4.Debounces[tostring(v5.UserId) .. v6] then
							warn("[NETWORK]", v5, "request was denied because they called the even sooner than the debounce.", v6);
							return;
						end;
						v4.Debounces[tostring(v5.UserId) .. v6] = true;
						task.delay(0.1, function() --[[ Line: 524 ]]
							-- upvalues: v4 (copied), v5 (read), v6 (read)
							v4.Debounces[tostring(v5.UserId) .. v6] = nil;
						end);
					end;
					if v7 then
						v1:CheckAdminPerms(v5, {
							Remote = v6
						}, ...);
					end;
					if v1:IsSafe(v5, {
						...
					}, v6) then
						return;
					end;
					return v4.Callbacks[v6](v5, ...);
				end;
				warn("Remote Function " .. v6 .. " doesn't exist");
			end;
			return;
		end;
		if l_RunService_0:IsClient() then
			l_ReplicatedStorage_0.Remotes.RemoteEvent.OnClientEvent:Connect(function(v5, ...) --[[ Line: 548 ]]
				-- upvalues: v4 (read)
				if v4.PrintNetworkEvents then
					warn("[CALLED]", v5);
				end;
				if v4.Callbacks[v5] then
					for _, v7 in pairs(v4.Callbacks[v5]) do
						v7(...);
					end;
					return;
				else
					warn("Remote Event " .. v5 .. " doesn't exist");
				end;
			end);
			l_ReplicatedStorage_0.Remotes.UnreliableRemoteEvent.OnClientEvent:Connect(function(v5, ...) --[[ Line: 562 ]]
				-- upvalues: v4 (read)
				if v4.PrintNetworkEvents then
					warn("[CALLED]", v5);
				end;
				if v4.Callbacks[v5] then
					for _, v7 in pairs(v4.Callbacks[v5]) do
						v7(...);
					end;
					return;
				else
					warn("Unreliable Remote Event " .. v5 .. " doesn't exist");
				end;
			end);
		end;
	end
};