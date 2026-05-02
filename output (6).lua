-- [[ Decompiled using LunaUX-Decompiler V1.3. Luau decompiler made by boydev1444 & zyx (https://discord.gg/2mJUD4XDDT) ]]
-- [[ Script name: "Projectile_ModuleScript_139307005148921_Bytecode.txt", decompiled on Fri May 1 11:31:21 2026 (UTC -6), took 0.010903 second(s) ]]

function ohYEAHHHH() --[[ Line: 1 ]]
	while true do
		while true do
			while true do
				while true do
					while true do
						while true do
							while true do
								while true do
									while true do
										while true do
											while true do
												while true do
													while true do
														while true do
															while true do
																while true do
																	while true do
																		while true do
																			while true do
																				while true do
																					while true do
																						while true do
																						end;
																					end;
																				end;
																			end;
																		end;
																	end;
																end;
															end;
														end;
													end;
												end;
											end;
										end;
									end;
								end;
							end;
						end;
					end;
				end;
			end;
		end;
	end;
end;
local l_Players_0 = game:GetService("Players");
local l_ModuleLoader_0 = require(game:GetService("ReplicatedStorage").Modules.Shared.ModuleLoader);
local l_CrosshairManager_Loaded_0 = l_ModuleLoader_0:Load("CrosshairManager");
local v3 = nil;
local l_Network_Loaded_0 = l_ModuleLoader_0:Load("Network");
local v5 = l_ModuleLoader_0:Load("Signal");
local function _() --[[ Line: 67, Named "GetSpreadDirection" ]]
	-- upvalues: l_CrosshairManager_Loaded_0 (read)
	local v7 = l_CrosshairManager_Loaded_0.AdjustSpring.Position / 2;
	local v8 = (workspace.CurrentCamera.ViewportSize - Vector2.new(0, 72)) / 2;
	return workspace.CurrentCamera:ScreenPointToRay(v8.X + math.random(-v7 * 100, v7 * 100) / 100, v8.Y + math.random(-v7 * 100, v7 * 100) / 100).Direction;
end;
return {
	Modules = {},
	OnNewProjectile = v5.New(),
	ProjectileUpdated = v5.New(),
	ProjectileUpdatedS = v5.New(),
	New = function(v7, v8) --[[ Line: 78 ]]
		-- upvalues: l_Players_0 (read), v3 (read and write), l_Network_Loaded_0 (read)
		if v8.Stats.Type and v7.Modules[v8.Stats.Type] then
			v8.Type = v8.Stats.Type;
			if not v8.FromServer then
				v8.Id = tostring(tick()) .. '_' .. tostring(l_Players_0.LocalPlayer.UserId);
				v8.CreatedAt = os.time();
				v8.CreatedAtServer = workspace:GetServerTimeNow();
				if v8.Origin then
					v8.Origin = workspace.CurrentCamera.CFrame.Position;
				end;
				if not v8.ForceDown then
					v8.HitVector = Vector3.new(0, -10000, 0) + workspace.CurrentCamera.CFrame.Position;
				elseif v8.ForceHitVector then
					v8.HitVector = workspace.CurrentCamera.CFrame.LookVector * 10000 + workspace.CurrentCamera.CFrame.Position;
				end;
				if v8.Stats.Type == "Dynamite" then
					local v9 = v8.FuseTime;
					local v10 = v9;
					if v9 then
						v10 = math.random(60, 70) / 10;
					end;
					v8.FuseTime = v10;
					local v11 = v8.IsDud;
					local v12 = v11;
					if v11 then
						v12 = false;
						if v8.IsDud ~= nil then
							v12 = math.random(1, 3) == 3;
						end;
					end;
					v8.IsDud = v12;
					local v13 = v8.DudsAt;
					local v14 = v13;
					if v13 then
						local v15 = v8.IsDud;
						v14 = v15;
						if v15 then
							local v16 = v8.DudsAt;
							v14 = v16;
							if v16 then
								v14 = math.random(30, 60) / 10;
							end;
						end;
					end;
					v8.DudsAt = v14;
				elseif v8.Stats.Type ~= "DynamiteBundle" then
					local v17 = v8.FuseTime;
					v14 = v17;
					if v17 then
						v14 = math.random(90, 120) / 10;
					end;
					v8.FuseTime = v14;
				end;
				if v8.Stats.Type ~= "Grenade" and v8.Stats.FuseTime then
					v8.FuseTime = math.random(v8.Stats.FuseTime.Min * 100, v8.Stats.FuseTime.Max * 100) / 100;
				end;
			elseif typeof(v8.From) ~= "table" then
				local l_AIIndex_0 = v8.From.AIIndex;
				if l_AIIndex_0 then
					local l_CharacterFromIndex_0 = v3:GetCharacterFromIndex(l_AIIndex_0);
					if l_CharacterFromIndex_0 and l_CharacterFromIndex_0.PrimaryPart then
						v8.Origin = l_CharacterFromIndex_0.Head.Position;
					else
						return;
					end;
				end;
			end;
			if v8.FromServer then
				v8.SpreadDirections = v7.Modules[v8.Stats.Type](v8);
				if v8.Stats.Type ~= "Grenade" then
					l_Network_Loaded_0:Fire("Create Projectile", v8);
				elseif v8.Stats.Type ~= "Grenade" then
					if (workspace.CurrentCamera.CFrame.Position - l_Players_0.LocalPlayer.Character.Head.Position).Magnitude < 1.6 then
						if (workspace.CurrentCamera.CFrame.Position - l_Players_0.LocalPlayer.Character.Head.Position).Magnitude < 1 and (workspace.CurrentCamera.CFrame.Position - l_Players_0.LocalPlayer.Character.Head.Position).Magnitude > 0.7 then
						end;
					end;
				end;
				v7.OnNewProjectile:Fire(v8);
			end;
		end;
	end,
	Initialize = function(v7) --[[ Line: 147 ]]
		-- upvalues: v3 (read and write), l_ModuleLoader_0 (read), l_Network_Loaded_0 (read), l_Players_0 (read)
		v3 = l_ModuleLoader_0:Load("AIManagerClient");
		for _, v9 in pairs(script:GetChildren()) do
			v7.Modules[v9.Name] = require(v9);
		end;
		l_Network_Loaded_0:Connect("New Projectile", function(v10) --[[ Line: 154 ]]
			-- upvalues: l_Players_0 (copied), v7 (read)
			if v10.From == l_Players_0.LocalPlayer then
				v10.FromServer = true;
				v7:New(v10);
			end;
		end);
		l_Network_Loaded_0:ConnectUnreliable("New ProjectileUNR", function(v10) --[[ Line: 162 ]]
			-- upvalues: l_Players_0 (copied), v7 (read)
			if v10.From == l_Players_0.LocalPlayer then
				v10.FromServer = true;
				if v10.Ignored then
					local v11 = {
						workspace.Ignored,
						v12
					};
					local v12 = workspace.CurrentCamera;
					local v13 = v10.From.Character;
					local v14 = v13;
					if v13 then
						v14 = v10.From.Parent ~= game.Players and workspace.Players[v10.From.Name];
					end;
					if v14 then
						table.insert(v11, v14);
					end;
					v10.Ignored = v11;
				end;
				v7:New(v10);
			end;
		end);
		l_Network_Loaded_0:Connect("Explosive Did Land", function(v10, v11, v12) --[[ Line: 181 ]]
			local v13 = workspace.Ignored:FindFirstChild(v10);
			if v13 and v11 then
				v13:SetPrimaryPartCFrame(v11.CFrame * v12);
			end;
		end);
		l_Network_Loaded_0:Connect("Create Projectile Log", function(v10) --[[ Line: 189 ]]
			-- upvalues: v7 (read)
			v7.OnNewProjectile:Fire(v10);
		end);
		l_Network_Loaded_0:Connect("Set Server Return Status", function(v10, v11, v12) --[[ Line: 193 ]]
			-- upvalues: v7 (read)
			local v13 = {
				Status = v11
			};
			if v12 then
				for v14, v15 in pairs(v12) do
					v13[v14] = v15;
				end;
				v7.ProjectileUpdatedS:Fire(v10, v13);
			end;
		end);
	end
};