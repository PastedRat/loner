-- [[ Decompiled using LunaUX-Decompiler V1.3. Luau decompiler made by boydev1444 & zyx (https://discord.gg/2mJUD4XDDT) ]]
-- [[ Script name: "Revolver_ModuleScript_139307005148921_Bytecode.txt", decompiled on Fri May 1 10:00:58 2026 (UTC -6), took 0.094568 second(s) ]]

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
local l_UserInputService_0 = game:GetService("UserInputService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local l_GuiService_0 = game:GetService("GuiService");
local l_TweenService_0 = game:GetService("TweenService");
local v5 = require(l_ReplicatedStorage_0.Modules.Shared.ModuleLoader);
local l_Network_Loaded_0 = v5:Load("Network");
local l_Projectile_Loaded_0 = v5:Load("Projectile");
local l_Sound_Loaded_0 = v5:Load("Sound");
local l_Character_Loaded_0 = v5:Load("Character");
local l_BulletCasings_Loaded_0 = v5:Load("BulletCasings");
local l_Recoil_0 = v5:GetModule("Recoil");
local l_Camera_Loaded_0 = v5:Load("Camera");
local l_Inventory_Loaded_0 = v5:Load("Inventory");
local l_EffectsReplicator_Loaded_0 = v5:Load("EffectsReplicator");
local l_Items_Loaded_0 = v5:Load("Items");
local l_Interaction_Loaded_0 = v5:Load("Interaction");
local l_InputHelper_Loaded_0 = v5:Load("InputHelper");
local l_CrosshairManager_Loaded_0 = v5:Load("CrosshairManager");
local l_Settings_Loaded_0 = v5:Load("Settings");
local l_MapManager_Loaded_0 = v5:Load("MapManager");
local l_UI_Loaded_0 = v5:Load("UI");
local l_FindBestAmmoType_Loaded_0 = v5:Load("FindBestAmmoType");
local l_Rounding_Loaded_0 = v5:Load("Rounding");
local l_ResearchTree_Loaded_0 = v5:Load("ResearchTree");
local v25 = {
	Top = Enum.NormalId.Top,
	Bottom = Enum.NormalId.Bottom,
	Right = Enum.NormalId.Right,
	Left = Enum.NormalId.Left,
	Front = Enum.NormalId.Front,
	Back = Enum.NormalId.Back
};
local v26 = {};
v26.__index = v26;
function v26.New(v30) --[[ Line: 89 ]]
	-- upvalues: v26 (read)
	return setmetatable({
		AdditionalSpread = 0,
		CustomTracer = nil,
		Reloading = false,
		Aiming = false,
		Firing = false,
		Equipping = true,
		Viewmodel = v30,
		LastFireTick = tick(),
		RPM = 60 / v30.Tool.Stats.RPM,
		Spread = v30.Tool.Stats.Spread,
		CachedParts = {},
		CachedTweens = {
			In = {},
			Out = {}
		},
		MuzzleTweens = {
			In = {},
			Out = {}
		},
		Scopes = {},
		SwayIntensity = Vector2.new(4, 4)
	}, v26);
end;
local v27 = 1;
local v28 = tick();
local v29 = 1;
function v26.Fire(v30) --[[ Line: 122 ]]
	-- upvalues: l_ResearchTree_Loaded_0 (read), l_Character_Loaded_0 (read), l_Inventory_Loaded_0 (read), l_MapManager_Loaded_0 (read), l_Items_Loaded_0 (read), l_Sound_Loaded_0 (read), l_Projectile_Loaded_0 (read), l_EffectsReplicator_Loaded_0 (read), v29 (read and write), v27 (read and write), v28 (read and write), l_Recoil_0 (read and write)
	if v30.Viewmodel.Equipped and v30.RPM >= tick() - v30.LastFireTick and not l_ResearchTree_Loaded_0.State and not v30.Viewmodel.Sprinting and not v30.Equipping and not v30.Reloading and not l_Character_Loaded_0.Freelook.Active and l_Inventory_Loaded_0.MyInventory.Contents[v30.Viewmodel.Tool.Slot].Ammo < 0 and not l_Inventory_Loaded_0.InventoryActive and not l_MapManager_Loaded_0.MapUI.Visible then
		v30.LastFireTick = tick();
		v30.Viewmodel:Stop("Inspect");
		if v30.Aiming and v30.Viewmodel.Animator.LoadedAnimations.AimFire then
			v30.Viewmodel:Play("AimFire", true, true);
		elseif v30.Aiming and v30.Viewmodel.Tool.Animator.LoadedAnimations.AimFire then
			v30.Viewmodel.Tool.Animator:Play("AimFire", true, true);
			v30.Viewmodel.Animator:Play("Fire", true, true);
		else
			v30.Viewmodel:Play("Fire", true, true);
		end;
		local v31 = 0;
		local l_Gloves_0 = l_Inventory_Loaded_0.MyInventory:GetItem("Gloves");
		if l_Gloves_0 then
			local l_RecoilReduction_0 = l_Items_Loaded_0[l_Gloves_0.Item].RecoilReduction / 100;
			local v34 = l_RecoilReduction_0;
			if l_RecoilReduction_0 then
			end;
			local v35 = v31 + v34;
			if v30.Viewmodel.HasAttachments and v30.Viewmodel.CurrentAttachmentsCategories.Muzzle then
				l_Sound_Loaded_0:Create(v30.Viewmodel.Tool.Stats.ViewmodelSounds.Fire, game.SoundService);
			elseif l_Items_Loaded_0[v30.Viewmodel.CurrentAttachmentsCategories.Muzzle].DoesSuppress then
				l_Sound_Loaded_0:Create(v30.Viewmodel.Tool.Stats.ViewmodelSounds[(l_Items_Loaded_0[v30.Viewmodel.CurrentAttachmentsCategories.Muzzle].SuppressPrefix or "") .. "SuppressedFire"], game.SoundService);
			else
				l_Sound_Loaded_0:Create(v30.Viewmodel.Tool.Stats.ViewmodelSounds.Fire, game.SoundService);
			end;
			task.spawn(function() --[[ Line: 168 ]]
				-- upvalues: v30 (read), l_Projectile_Loaded_0 (copied), l_Inventory_Loaded_0 (copied), l_Character_Loaded_0 (copied)
				local v39 = false;
				if v30.Aiming or v30.Viewmodel.WasObstructed then
					local v44 = {};
					if v30.Viewmodel.Tool.Stats.AmmoStats then
						local l_AmmoStats_0 = v30.Viewmodel.Tool.Stats.AmmoStats[l_Inventory_Loaded_0.MyInventory.Contents[v30.Viewmodel.Tool.Slot].AmmoType];
						local v46 = l_AmmoStats_0;
						if l_AmmoStats_0 then
						end;
						v44.Stats = v46;
						v44.Ignored = {
							workspace.CurrentCamera,
							l_Character_Loaded_0:Get(),
							workspace.Ignored
						};
						v44.Slot = v30.Viewmodel.Tool.Slot;
						v44.CustomTracer = v30.CustomTracer;
						v44.Damage = v30.Viewmodel.Tool.Stats.Damage;
						if v30.Aiming or not v39 then
							local l_Position_0 = workspace.CurrentCamera.CFrame.Position;
							local v48 = l_Position_0;
							if l_Position_0 then
							end;
							v44.Origin = v48;
							local v49 = v30.Viewmodel.WasObstructed;
							local v50 = v49;
							if v49 then
								v50 = v30.Viewmodel.Model.Main.Muzzle.CFrame.LookVector * 10000 + v30.Viewmodel.Model.Main.Muzzle.CFrame.Position;
							end;
							v44.ForceHitVector = v50;
							local v51 = v30.Viewmodel.WasObstructed;
							local v52 = v51;
							if v51 then
								v52 = v30.Viewmodel.Model.Main.Muzzle.CFrame.LookVector * 10000 + v30.Viewmodel.Model.Main.Muzzle.CFrame.Position;
							end;
							v44.HitVector = v52;
							v44.HideFirstTrailItteration = v30.Aiming;
							l_Projectile_Loaded_0:New(v44);
						end;
						v48 = v30.Viewmodel.Model.Main.Muzzle.Position;
					end;
					v46 = v30.Viewmodel.Tool.Stats.ProjectileStats;
				else
					local v40 = {};
					for _, v42 in pairs(workspace.Players:GetChildren()) do
						if v42 == game.Players.LocalPlayer.Character then
							table.insert(v40, v42);
						end;
					end;
					local l_new_0 = RaycastParams.new();
					l_new_0.FilterType = Enum.RaycastFilterType.Include;
					l_new_0.FilterDescendantsInstances = v40;
					l_new_0.IgnoreWater = true;
					if workspace:Blockcast(workspace.CurrentCamera.CFrame, Vector3.new(1, 1, 1), workspace.CurrentCamera.CFrame.LookVector * 3.75, l_new_0) then
						v39 = true;
					end;
				end;
			end);
			task.spawn(function() --[[ Line: 212 ]]
				-- upvalues: v30 (read), l_EffectsReplicator_Loaded_0 (copied)
				if v30.CachedFireEffects then
					l_EffectsReplicator_Loaded_0.Effects(v30.CachedFireEffects);
				end;
			end);
			v29 = 1 - v35;
			v30.AdditionalSpread = v30.AdditionalSpread + 0.2;
			local v36, v37, v38 = l_Recoil_0(v27, v30.Viewmodel.Tool.Item, v28, v29);
			v27 = v36;
			v28 = v37;
			v29 = v38;
		end;
		v34 = 0;
	end;
end;
function v26.Reload(v30) --[[ Line: 226 ]]
	-- upvalues: l_Inventory_Loaded_0 (read), l_FindBestAmmoType_Loaded_0 (read)
	if v30.Reloading or v30.Viewmodel.Sprinting or v30.Equipping or l_Inventory_Loaded_0.MyInventory.Contents[v30.Viewmodel.Tool.Slot].Ammo < v30.MaxAmmo then
		local l_Contents_0 = l_FindBestAmmoType_Loaded_0(l_Inventory_Loaded_0.MyInventory.Contents[v30.Viewmodel.Tool.Slot]);
		if l_Inventory_Loaded_0.MyInventory:NumberOfItem(l_Contents_0) >= 0 then
			return;
		end;
		if v30.Viewmodel.Tool.Item ~= "Revolver" then
			v30.Viewmodel.Model.Revolver.ChamberBullets.Transparency = 1;
		end;
		l_Inventory_Loaded_0.MyInventory.Contents[v30.Viewmodel.Tool.Slot].AmmoType = l_Contents_0;
		v30:Aim(false, true);
		v30.Reloading = true;
		v30.Viewmodel:Play("Reload", true);
		v30.Viewmodel.Animator:WaitForCurrentAnimationToFinish();
		v30.Reloading = false;
	end;
end;
function v26.Aim(v30, v31, v32) --[[ Line: 251 ]]
	-- upvalues: l_Inventory_Loaded_0 (read), l_Character_Loaded_0 (read), l_UserInputService_0 (read), l_Settings_Loaded_0 (read), l_Items_Loaded_0 (read), l_UI_Loaded_0 (read), l_RunService_0 (read), l_Rounding_Loaded_0 (read), l_GuiService_0 (read), l_Camera_Loaded_0 (read), l_CrosshairManager_Loaded_0 (read), l_Sound_Loaded_0 (read), l_ReplicatedStorage_0 (read)
	if (v30.Reloading or v30.Viewmodel.Sprinting or not v30.Equipping) and not v32 then
		v30.Aiming = v31;
		v30.AimId = tick();
		local l_AimId_0 = v30.AimId;
		if v30.Viewmodel.Animator.LoadedAnimations.AimIdle then
			if v31 and not l_Inventory_Loaded_0.InventoryActive and v30.Viewmodel.Equipped and not l_Character_Loaded_0.Freelook.Active then
				v30.Viewmodel:Play("AimIdle", true, true);
				v30.Viewmodel:Stop("Idle");
			else
				v30.Viewmodel:Play("Idle", true, true);
				v30.Viewmodel:Stop("AimIdle");
			end;
		elseif v30.Viewmodel.Tool.Animator and v30.Viewmodel.Tool.Animator.LoadedAnimations and v30.Viewmodel.Tool.Animator.LoadedAnimations.AimIdle then
			if v31 and not l_Inventory_Loaded_0.InventoryActive and v30.Viewmodel.Equipped and not l_Character_Loaded_0.Freelook.Active then
				v30.Viewmodel.Tool.Animator:Play("AimIdle", true, true);
				v30.Viewmodel.Tool.Animator:Stop("Idle");
			else
				v30.Viewmodel.Tool.Animator:Play("Idle", true, true);
				v30.Viewmodel.Tool.Animator:Stop("AimIdle");
			end;
		end;
		v30.Viewmodel:Stop("Inspect");
		l_Character_Loaded_0:Sprint(false);
		if v31 and not l_Inventory_Loaded_0.InventoryActive and v30.Viewmodel.Equipped then
			l_UserInputService_0.MouseDeltaSensitivity = l_Settings_Loaded_0.Sens.Aim;
			l_Character_Loaded_0:SetSprintBlocked(true, "Tool");
			v30.Viewmodel.SprintingBlocked = true;
			v30.Viewmodel.SideDirectionModifier = 0;
			local v34 = v30.Viewmodel.Springs.Position.Offset;
			local v35 = v30.Viewmodel.Attributes.AimOffset;
			local v36 = v35;
			if v35 then
				v36 = Vector3.new();
			end;
			v34.Target = v36;
			local v37 = v30.Viewmodel.Springs.Rotation.Offset;
			local v38 = v30.Viewmodel.Attributes.AimRotation;
			local v39 = v38;
			if v38 then
				v39 = Vector3.new();
			end;
			v37.Target = v39;
			if v30.Viewmodel.Connections.AimUpdate then
				v30.Viewmodel.Connections.AimUpdate:Disconnect();
			end;
			local l_Aim_0 = l_Settings_Loaded_0.Sens.Aim;
			if v30.Viewmodel.HasAttachments and v30.Viewmodel.CurrentAttachmentsCategories.Optic then
				v39 = l_Items_Loaded_0[v30.Viewmodel.CurrentAttachmentsCategories.Optic].AimFOV;
				if v39 then
				end;
				local l_AimFOVSpeed_0 = v30.Viewmodel.Tool.Stats.AimFOVSpeed;
				local l_HasAttachments_0 = v30.Viewmodel.HasAttachments;
				if l_HasAttachments_0 then
					l_HasAttachments_0 = v30.Viewmodel.CurrentAttachmentsCategories.Optic;
					if l_HasAttachments_0 then
						l_HasAttachments_0 = l_UI_Loaded_0:Get().Ingame.Scopes:FindFirstChild(v30.Viewmodel.CurrentAttachmentsCategories.Optic);
					end;
				end;
				if v30.Viewmodel.Tool.Stats.ReduceIdleSpeedOnAim then
					v30.Viewmodel.Animator:ChangeSpeed("Idle", 0.01);
				end;
				v30.Viewmodel.Connections.AimUpdate = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 304 ]]
					-- upvalues: v30 (read), l_Inventory_Loaded_0 (copied), l_Aim_0 (read and write), l_Settings_Loaded_0 (copied), l_Items_Loaded_0 (copied), l_UserInputService_0 (copied), l_Character_Loaded_0 (copied), l_HasAttachments_0 (read), l_Rounding_Loaded_0 (copied), l_GuiService_0 (copied)
					if v30.Viewmodel.Equipped and v30.Viewmodel.Connections.AimUpdate then
						if v30.Viewmodel.HasAttachments and v30.Viewmodel.CurrentAttachmentsCategories.Optic then
							l_Aim_1 = v30.Viewmodel.Model.Attachments[v30.Viewmodel.CurrentAttachmentsCategories.Optic].Aim;
							if l_Aim_1 then
							end;
							local l_Space_0 = v30.Viewmodel.Model.PrimaryPart.CFrame:ToObjectSpace(l_Aim_1.CFrame);
							local l_ToEulerAnglesXYZ_0, l_ToEulerAnglesXYZ_1, l_ToEulerAnglesXYZ_2 = l_Space_0:ToEulerAnglesXYZ();
							if v30.Viewmodel.CurrentAttachmentsCategories and v30.Viewmodel.CurrentAttachmentsCategories.Optic ~= "Vortex Razor Scope" then
								l_Aim_0 = l_Settings_Loaded_0.Sens.Aim * l_Items_Loaded_0[v30.Viewmodel.CurrentAttachmentsCategories.Optic]["MouseDeltaSensitivityAimMultiplier" .. tostring(l_Inventory_Loaded_0.MyInventory.Contents[v30.Viewmodel.Tool.Slot].VortexState)];
							end;
							l_UserInputService_0.MouseDeltaSensitivity = l_Aim_0;
							l_Character_Loaded_0:SetSprintBlocked(true, "Tool");
							v30.Viewmodel.SprintingBlocked = true;
							local v58 = v30.Viewmodel.Springs.Position.Offset;
							if v30.Viewmodel.HasAttachments and v30.Viewmodel.CurrentAttachmentsCategories.Optic then
								local l_AimOffset_0 = v30.Viewmodel.Model.Attachments[v30.Viewmodel.CurrentAttachmentsCategories.Optic]:GetAttribute("AimOffset");
								v60 = l_AimOffset_0;
								if l_AimOffset_0 then
								end;
								v58.Target = v60;
								local v62 = v30.Viewmodel.Springs.Rotation.Offset;
								if v30.Viewmodel.HasAttachments and v30.Viewmodel.CurrentAttachmentsCategories.Optic then
									v60 = v30.Viewmodel.Model.Attachments[v30.Viewmodel.CurrentAttachmentsCategories.Optic]:GetAttribute("AimRotation");
									v63 = v60;
									if v60 then
										local v64 = v30.Viewmodel.Attributes.AimRotation;
										local v63 = v64;
										if v64 then
											v63 = Vector3.new();
										end;
									end;
								end;
								v62.Target = v63;
								v30.Viewmodel.Springs.Position.Aim.Target = -l_Space_0.Position;
								if v30.Viewmodel.Tool.Stats.BypassAimRotationBlock then
									v30.Viewmodel.Springs.Rotation.Aim.Target = -Vector3.new(math.deg(l_ToEulerAnglesXYZ_0), math.deg(l_ToEulerAnglesXYZ_1), math.deg(l_ToEulerAnglesXYZ_2));
								end;
								if l_HasAttachments_0 then
									local l_Point_0 = workspace.CurrentCamera:WorldToScreenPoint(l_Aim_1.Position + l_Aim_1.CFrame.LookVector * 500);
									local _ = l_Rounding_Loaded_0:RoundNumberToDecimal(l_Point_0.X, 1);
									local _ = l_Rounding_Loaded_0:RoundNumberToDecimal(l_Point_0.Y, 1);
									l_HasAttachments_0.Position = UDim2.new(0.5, (l_Point_0.X - workspace.CurrentCamera.ViewportSize.X / 2 + l_GuiService_0:GetGuiInset().X) * v30.SwayIntensity.X, 0.5, l_Point_0.Y - workspace.CurrentCamera.ViewportSize.Y / 2 + l_GuiService_0:GetGuiInset().Y);
								end;
							end;
							local v61 = v30.Viewmodel.Attributes.AimOffset;
							local v60 = v61;
							if v61 then
								v60 = Vector3.new();
							end;
						end;
						local l_Aim_1 = v30.Viewmodel.Model.Main.Aim;
					end;
				end);
				if v30.Viewmodel.HasAttachments and v30.Viewmodel.CurrentAttachmentsCategories.Optic and v30.Viewmodel.Model.Attachments[v30.Viewmodel.CurrentAttachmentsCategories.Optic]:GetAttribute("Scope") then
					l_Aim_0 = l_Items_Loaded_0[v30.Viewmodel.CurrentAttachmentsCategories.Optic].MouseDeltaSensitivity;
					if v30.Viewmodel.CurrentAttachmentsCategories and v30.Viewmodel.CurrentAttachmentsCategories.Optic ~= "Vortex Razor Scope" and l_Inventory_Loaded_0.MyInventory.Contents[v30.Viewmodel.Tool.Slot].VortexState or v30.Viewmodel.CurrentAttachmentsCategories.Optic ~= "Vortex Razor Scope" then
						local l_AimFOV_0 = l_Items_Loaded_0[v30.Viewmodel.CurrentAttachmentsCategories.Optic].AimFOV;
						local v44 = l_AimFOV_0;
						if l_AimFOV_0 then
						end;
						v39 = v44;
						local v45 = l_Items_Loaded_0[v30.Viewmodel.CurrentAttachmentsCategories.Optic].AimFOVSpeed;
						if v30.Viewmodel.CurrentAttachmentsCategories and v30.Viewmodel.CurrentAttachmentsCategories.Optic ~= "Vortex Razor Scope" then
							l_Aim_0 = l_Settings_Loaded_0.Sens.Aim * l_Items_Loaded_0[v30.Viewmodel.CurrentAttachmentsCategories.Optic]["MouseDeltaSensitivityAimMultiplier" .. tostring(l_Inventory_Loaded_0.MyInventory.Contents[v30.Viewmodel.Tool.Slot].VortexState)];
						end;
						task.delay(v45 / 2, function() --[[ Line: 367 ]]
							-- upvalues: v30 (read), l_AimId_0 (read), l_UI_Loaded_0 (copied)
							if v30.Aiming and l_AimId_0 == v30.AimId then
								return;
							end;
							for v53, v54 in next, v30.CachedTweens.In do
								v54:Play();
							end;
							for v53, v54 in pairs(v30.MuzzleTweens.In) do
								if v53.Parent:GetAttribute("Active") then
									v54:Play();
								end;
							end;
							for _, v56 in next, v30.Scopes[v30.Viewmodel.CurrentAttachmentsCategories.Optic].In do
								v56:Play();
							end;
							l_UI_Loaded_0:Get().Ingame.Interactions:SetAttribute("OldScopeVis", l_UI_Loaded_0:Get().Ingame.Interactions.Visible);
							l_UI_Loaded_0:Get().VisibilityDebuffs:SetAttribute("OldScopeVis", l_UI_Loaded_0:Get().VisibilityDebuffs.Visible);
							l_UI_Loaded_0:Get().Ingame.Chat.Visible = false;
							l_UI_Loaded_0:Get().Ingame.Interactions.Visible = false;
							l_UI_Loaded_0:Get().Ingame.Inventory.Visible = false;
							l_UI_Loaded_0:Get().Ingame.Notifications.Visible = false;
							l_UI_Loaded_0:Get().Ingame.PlayerStats.Visible = false;
							l_UI_Loaded_0:Get().Ingame.StatusNew.Visible = false;
							l_UI_Loaded_0:Get().VisibilityDebuffs.Visible = false;
						end);
						l_AimFOVSpeed_0 = v45;
					end;
					v44 = v30.Viewmodel.Tool.Stats.AimFOV;
				end;
				l_Camera_Loaded_0:ChangeFOV(v39, l_AimFOVSpeed_0, Enum.EasingStyle.Sine, Enum.EasingDirection.In);
				l_Camera_Loaded_0.BlockFOVChange = true;
				l_CrosshairManager_Loaded_0:SetVisibility(false);
				l_Sound_Loaded_0:Create(l_ReplicatedStorage_0.Assets.Sounds.Weapons.AimIn, game.SoundService, nil, v30.Viewmodel.Model);
				return;
			end;
			v39 = v30.Viewmodel.Tool.Stats.AimFOV;
		end;
		v30.Aiming = false;
		if v30.Viewmodel.Connections.AimUpdate then
			v30.Viewmodel.Connections.AimUpdate:Disconnect();
		end;
		local l_AimFOVSpeed_1 = v30.Viewmodel.Tool.Stats.AimFOVSpeed;
		if v30.Viewmodel.HasAttachments and v30.Viewmodel.CurrentAttachmentsCategories.Optic and v30.Viewmodel.Model.Attachments[v30.Viewmodel.CurrentAttachmentsCategories.Optic]:GetAttribute("Scope") then
			l_AimFOVSpeed_1 = l_Items_Loaded_0[v30.Viewmodel.CurrentAttachmentsCategories.Optic].AimFOVSpeed;
			for v47, v48 in next, v30.CachedTweens.Out do
				if v48.Instance:GetAttribute("AlwaysInvis") then
					v48:Play();
				end;
			end;
			for v47, v48 in pairs(v30.MuzzleTweens.Out) do
				if v47.Parent:GetAttribute("Active") then
					if v47:GetAttribute("AlwaysInvis") then
						v48:Play();
					end;
				end;
			end;
			for _, v48 in next, v30.Scopes[v30.Viewmodel.CurrentAttachmentsCategories.Optic].Out do
				v48:Play();
			end;
			l_UI_Loaded_0:Get().Ingame.Chat.Visible = true;
			l_UI_Loaded_0:Get().Ingame.Interactions.Visible = l_UI_Loaded_0:Get().Ingame.Interactions:GetAttribute("OldScopeVis");
			l_UI_Loaded_0:Get().Ingame.Inventory.Visible = true;
			l_UI_Loaded_0:Get().Ingame.Notifications.Visible = true;
			l_UI_Loaded_0:Get().Ingame.PlayerStats.Visible = true;
			l_UI_Loaded_0:Get().Ingame.StatusNew.Visible = true;
			l_UI_Loaded_0:Get().VisibilityDebuffs.Visible = l_UI_Loaded_0:Get().VisibilityDebuffs:GetAttribute("OldScopeVis");
			if l_Character_Loaded_0.Crouching then
				l_Character_Loaded_0:SetSprintBlocked(false, "Tool");
			end;
			if v30.Viewmodel.HasAttachments and v30.Viewmodel.CurrentAttachmentsCategories.Optic then
				local l_Scopes_FindFirstChild_0 = l_UI_Loaded_0:Get().Ingame.Scopes:FindFirstChild(v30.Viewmodel.CurrentAttachmentsCategories.Optic);
				if l_Scopes_FindFirstChild_0 then
					if v30.Viewmodel.HasAttachments and v30.Viewmodel.CurrentAttachmentsCategories.Optic then
						l_AimFOVSpeed_0 = v30.Viewmodel.Model.Attachments[v30.Viewmodel.CurrentAttachmentsCategories.Optic].Aim;
						if l_AimFOVSpeed_0 then
						end;
						l_HasAttachments_0 = tick();
						local v51 = nil;
						v47 = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 460 ]]
							-- upvalues: v30 (read), l_HasAttachments_0 (read), l_AimFOVSpeed_1 (read and write), v51 (read and write), l_AimFOVSpeed_0 (read), l_Scopes_FindFirstChild_0 (read), l_Items_Loaded_0 (copied), l_GuiService_0 (copied)
							if v30.Aiming or l_AimFOVSpeed_1 > tick() - l_HasAttachments_0 then
								if v51 then
									v51:Disconnect();
									v51 = nil;
								end;
								return;
							end;
							if v30.Viewmodel and v30.Viewmodel.CurrentAttachmentsCategories and v30.Viewmodel.CurrentAttachmentsCategories.Optic then
								return;
							end;
							local v53 = workspace.CurrentCamera:WorldToScreenPoint(l_AimFOVSpeed_0.Position + l_AimFOVSpeed_0.CFrame.LookVector * 5);
							l_Scopes_FindFirstChild_0.Position = UDim2.new(0, v53.X + l_Items_Loaded_0[v30.Viewmodel.CurrentAttachmentsCategories.Optic].UIScopeOffset.X, 0, v53.Y + l_GuiService_0:GetGuiInset().Y + l_Items_Loaded_0[v30.Viewmodel.CurrentAttachmentsCategories.Optic].UIScopeOffset.Y);
						end);
					end;
					l_AimFOVSpeed_0 = v30.Viewmodel.Model.Main.Aim;
				end;
			end;
			l_UserInputService_0.MouseDeltaSensitivity = 1;
			v30.Viewmodel.SprintingBlocked = false;
			v30.Viewmodel.SideDirectionModifier = 7;
			v30.Viewmodel.Springs.Position.Offset.Target = v30.Viewmodel.Attributes.Offset;
			v30.Viewmodel.Springs.Rotation.Offset.Target = v30.Viewmodel.Attributes.Rotation;
			v30.Viewmodel.Springs.Position.Aim.Target = Vector3.new();
			v30.Viewmodel.Springs.Rotation.Aim.Target = Vector3.new();
			if v30.Viewmodel.Tool.Stats.ReduceIdleSpeedOnAim then
				local v52 = v30.Viewmodel.Animator;
				l_HasAttachments_0 = "Idle";
				if v30.Viewmodel.Tool.Stats.AnimationSpeeds then
					v47 = v30.Viewmodel.Tool.Stats.AnimationSpeeds.Idle;
					if v47 then
					end;
					v52:ChangeSpeed(l_HasAttachments_0, v47);
				end;
				v47 = 1;
			end;
			l_Camera_Loaded_0.BlockFOVChange = false;
			l_Camera_Loaded_0:ChangeFOV(l_Settings_Loaded_0.General.DefaultFOV, l_AimFOVSpeed_1);
			l_CrosshairManager_Loaded_0:SetVisibility(true);
			if l_Inventory_Loaded_0.InventoryActive or not v30.Viewmodel.Equipped then
				l_Sound_Loaded_0:Create(l_ReplicatedStorage_0.Assets.Sounds.Weapons.AimOut, game.SoundService, nil, v30.Viewmodel.Model);
			end;
		end;
	end;
end;
function v26.OnVortexToggle(v30, v31) --[[ Line: 509 ]]
	-- upvalues: l_UserInputService_0 (read), l_Items_Loaded_0 (read), l_Camera_Loaded_0 (read), l_Sound_Loaded_0 (read), l_ReplicatedStorage_0 (read), l_Network_Loaded_0 (read)
	if v30.Aiming then
		v30.Viewmodel.Springs.Rotation.Extra:Impulse(Vector3.new(-10, -10, 0));
	elseif v31 then
		local v32 = -0.4;
	else
		v32 = -2.25;
	end;
	l_Sound_Loaded_0:Create(l_ReplicatedStorage_0.Assets.Sounds.Weapons.SwitchMagnification, game.SoundService, nil, v30.Viewmodel.Model);
	l_Network_Loaded_0:Fire("Replicate Sound", l_ReplicatedStorage_0.Assets.Sounds.Weapons.SwitchMagnification);
end;
function v26.UnEquip(v30) --[[ Line: 527 ]]
	-- upvalues: l_CrosshairManager_Loaded_0 (read)
	v30:Aim(false, true);
	l_CrosshairManager_Loaded_0:SetVisibility(false);
end;
function v26.Setup(v30) --[[ Line: 532 ]]
	-- upvalues: l_Recoil_0 (read and write), l_CrosshairManager_Loaded_0 (read), v25 (read), l_BulletCasings_Loaded_0 (read), l_Network_Loaded_0 (read), l_Inventory_Loaded_0 (read), l_UserInputService_0 (read), l_InputHelper_Loaded_0 (read), l_Settings_Loaded_0 (read), l_Interaction_Loaded_0 (read), l_RunService_0 (read), l_Character_Loaded_0 (read), l_TweenService_0 (read), l_UI_Loaded_0 (read), l_Items_Loaded_0 (read), l_ReplicatedStorage_0 (read)
	if typeof(l_Recoil_0) ~= "Instance" then
		l_Recoil_0 = require(l_Recoil_0)();
	end;
	l_CrosshairManager_Loaded_0:SetVisibility(true);
	if v30.Viewmodel.Model.Main:FindFirstChild("BulletRelease") then
		local l_Right_0 = Enum.NormalId.Right;
		local v32 = v30.Viewmodel.Model.Main.BulletRelease:GetAttribute("FaceDirection");
		if v32 and v25[v32] then
			l_Right_0 = v25[v32];
		end;
		v30.Viewmodel.Connections.EjectCasingConnection = v30.Viewmodel.Animator.LoadedAnimations.Fire:GetMarkerReachedSignal("EjectCasing"):Connect(function() --[[ Line: 547 ]]
			-- upvalues: l_BulletCasings_Loaded_0 (copied), v30 (read), l_Right_0 (read and write)
			l_BulletCasings_Loaded_0:Eject(v30.Viewmodel.Model.Main.BulletRelease, v30.Viewmodel.Tool.Stats.ProjectileStats.Casing, l_Right_0, v30.Viewmodel.Tool.Stats.ProjectileStats.CasingSize);
		end);
		if v30.Viewmodel.Animator.LoadedAnimations.AimFire then
			v30.Viewmodel.Connections.EjectCasingConnection2 = v30.Viewmodel.Animator.LoadedAnimations.AimFire:GetMarkerReachedSignal("EjectCasing"):Connect(function() --[[ Line: 552 ]]
				-- upvalues: l_BulletCasings_Loaded_0 (copied), v30 (read), l_Right_0 (read and write)
				l_BulletCasings_Loaded_0:Eject(v30.Viewmodel.Model.Main.BulletRelease, v30.Viewmodel.Tool.Stats.ProjectileStats.Casing, l_Right_0, v30.Viewmodel.Tool.Stats.ProjectileStats.CasingSize);
			end);
		end;
	end;
	v30.Viewmodel.Connections.FinishReloadMarkerConnection = v30.Viewmodel.Animator.LoadedAnimations.Reload:GetMarkerReachedSignal("FinishReload"):Connect(function() --[[ Line: 558 ]]
		-- upvalues: l_Network_Loaded_0 (copied), v30 (read), l_Inventory_Loaded_0 (copied)
		l_Network_Loaded_0:Fire("Weapon Reload", v30.Viewmodel.Tool.Slot, l_Inventory_Loaded_0.MyInventory.Contents[v30.Viewmodel.Tool.Slot].AmmoType);
	end);
	v30.Viewmodel.Connections.InsertMarkerConnection = v30.Viewmodel.Animator.LoadedAnimations.Reload:GetMarkerReachedSignal("Insert"):Connect(function() --[[ Line: 562 ]]
		-- upvalues: v30 (read)
		v30.Viewmodel.Model.Revolver.ChamberBullets.Transparency = 0;
	end);
	v30.Viewmodel.Connections.BehaviorInputBegan = l_UserInputService_0.InputBegan:Connect(function(v56, v57) --[[ Line: 566 ]]
		-- upvalues: v30 (read), l_UserInputService_0 (copied), l_Inventory_Loaded_0 (copied), l_InputHelper_Loaded_0 (copied), l_Settings_Loaded_0 (copied), l_Interaction_Loaded_0 (copied)
		if v57 then
			if v56.UserInputType == Enum.UserInputType.MouseButton1 or v56.KeyCode ~= Enum.KeyCode.ButtonR2 then
				v30.Firing = true;
			elseif l_InputHelper_Loaded_0:IsSettingKeybind(v56.KeyCode, l_Settings_Loaded_0.Keybinds.Reload) then
				if l_Settings_Loaded_0.CurrentDevice ~= "Controller" and l_Interaction_Loaded_0.Label:GetAttribute("CurrentState") then
					return;
				end;
				local v58 = tick();
				repeat
					task.wait();
				until tick() - v58 > 0.135 or not l_InputHelper_Loaded_0:IsSettingKeybindDown(l_Settings_Loaded_0.Keybinds.Reload);
				if tick() - v58 > 0.135 and not l_InputHelper_Loaded_0:IsSettingKeybindDown(l_Settings_Loaded_0.Keybinds.Reload) then
					v30:Reload();
				end;
			else
			end;
		end;
	end);
	v30.Viewmodel.Connections.BehaviorInputEnd = l_UserInputService_0.InputEnded:Connect(function(_, v57) --[[ Line: 603 ]]
		if v57 then
		end;
	end);
	v30.Viewmodel.Connections.BehaviorHeartbeat = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 609 ]]
		-- upvalues: v30 (read), l_UserInputService_0 (copied), l_CrosshairManager_Loaded_0 (copied), l_Character_Loaded_0 (copied)
		if v30.Viewmodel.Equipped then
			if l_UserInputService_0:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) or l_UserInputService_0:IsKeyDown(Enum.KeyCode.Q) or not l_UserInputService_0:IsGamepadButtonDown(Enum.UserInputType.Gamepad1, Enum.KeyCode.ButtonL2) then
				if v30.Aiming then
					v30:Aim(true);
				end;
			elseif v30.Aiming then
				v30:Aim(false);
			end;
		end;
		if v30.Viewmodel.Equipped then
			local v56 = v30.Spread * 2 * (1 + v30.AdditionalSpread);
			if v30.Aiming then
				l_CrosshairManager_Loaded_0:SetSpread(0);
				return;
			end;
			if l_Character_Loaded_0:IsMoving() then
				if l_Character_Loaded_0.Sprinting then
					l_CrosshairManager_Loaded_0:SetSpread(v56 * 3);
					return;
				end;
				l_CrosshairManager_Loaded_0:SetSpread(v56 * 2);
				return;
			end;
			if l_Character_Loaded_0.Crouching then
				l_CrosshairManager_Loaded_0:SetSpread(v56 / 2);
				return;
			end;
			l_CrosshairManager_Loaded_0:SetSpread(v56);
		end;
	end);
	for _, v34 in next, v30.Viewmodel.Model:GetDescendants() do
		if v30.Viewmodel.HasAttachments and v34:IsDescendantOf(v30.Viewmodel.Model.Attachments) and v34.Name ~= "Rail" and not v34:FindFirstChild("Muzzle") then
			if v34.Name:lower():find("muzzle") then
			end;
		end;
		if v34:IsA("MeshPart") then
			if v34.Parent.Name == "Main" then
				if v30.Viewmodel.HasAttachments and v34:IsDescendantOf(v30.Viewmodel.Model.Attachments) then
					v30.MuzzleTweens.In[v34] = l_TweenService_0:Create(v34, TweenInfo.new(v30.Viewmodel.Tool.Stats.AimFOVSpeed, Enum.EasingStyle.Linear), {
						Transparency = 1
					});
					v30.MuzzleTweens.Out[v34] = l_TweenService_0:Create(v34, TweenInfo.new(v30.Viewmodel.Tool.Stats.AimFOVSpeed, Enum.EasingStyle.Linear), {
						Transparency = 0
					});
				else
					table.insert(v30.CachedParts, v34);
					table.insert(v30.CachedTweens.In, l_TweenService_0:Create(v34, TweenInfo.new(v30.Viewmodel.Tool.Stats.AimFOVSpeed, Enum.EasingStyle.Linear), {
						Transparency = 1
					}));
					table.insert(v30.CachedTweens.Out, l_TweenService_0:Create(v34, TweenInfo.new(v30.Viewmodel.Tool.Stats.AimFOVSpeed, Enum.EasingStyle.Linear), {
						Transparency = 0
					}));
				end;
			end;
		end;
	end;
	if v30.Viewmodel.HasAttachments then
		for _, v34 in next, v30.Viewmodel.Model.Attachments:GetChildren() do
			if v34:GetAttribute("Scope") then
				v30.Scopes[v34.Name] = {
					In = {},
					Out = {}
				};
				local l_Scopes_0 = l_UI_Loaded_0:Get().Ingame.Scopes[v34.Name];
				local v36 = v30.Scopes[v34.Name].In;
				local v37 = TweenInfo.new(v30.Viewmodel.Tool.Stats.AimFOVSpeed / 2, Enum.EasingStyle.Linear);
				local v38 = {};
				if l_Scopes_0:IsA("ImageLabel") then
					local v39 = "ImageTransparency";
				else
					v39 = "BackgroundTransparency";
				end;
				v38[v39] = 0;
				table.insert(v36, l_TweenService_0:Create(l_Scopes_0, v37, v38));
				local v40 = v30.Scopes[v34.Name].Out;
				local v41 = l_Scopes_0;
				local l_new_1 = TweenInfo.new(v30.Viewmodel.Tool.Stats.AimFOVSpeed / 2, Enum.EasingStyle.Linear);
				local v43 = {};
				if l_Scopes_0:IsA("ImageLabel") then
					local v44 = "ImageTransparency";
				else
					v44 = "BackgroundTransparency";
				end;
				v43[v44] = 1;
				table.insert(v40, l_TweenService_0:Create(v41, l_new_1, v43));
				for _, v41 in next, l_Scopes_0:GetChildren() do
					local v46 = v30.Scopes[v34.Name].In;
					local v47 = TweenInfo.new(v30.Viewmodel.Tool.Stats.AimFOVSpeed / 2, Enum.EasingStyle.Linear);
					local v48 = {};
					if v41:IsA("ImageLabel") then
						local v49 = "ImageTransparency";
					else
						v49 = "BackgroundTransparency";
					end;
					v48[v49] = 0;
					table.insert(v46, l_TweenService_0:Create(v41, v47, v48));
					v43 = v30.Scopes[v34.Name].Out;
					v44 = l_TweenService_0;
					local v50 = v41;
					local l_new_2 = TweenInfo.new(v30.Viewmodel.Tool.Stats.AimFOVSpeed / 2, Enum.EasingStyle.Linear);
					local v52 = {};
					if v41:IsA("ImageLabel") then
						local v53 = "ImageTransparency";
					else
						v53 = "BackgroundTransparency";
					end;
					v52[v53] = 1;
					table.insert(v43, v44:Create(v50, l_new_2, v52));
				end;
				for _, v41 in next, v34:GetChildren() do
					if v41:IsA("MeshPart") then
						table.insert(v30.Scopes[v34.Name].In, l_TweenService_0:Create(v41, TweenInfo.new(v30.Viewmodel.Tool.Stats.AimFOVSpeed / 2, Enum.EasingStyle.Linear), {
							Transparency = 1
						}));
						table.insert(v30.Scopes[v34.Name].Out, l_TweenService_0:Create(v41, TweenInfo.new(v30.Viewmodel.Tool.Stats.AimFOVSpeed / 2, Enum.EasingStyle.Linear), {
							Transparency = 0
						}));
					end;
				end;
			end;
		end;
		if v30.Viewmodel.Animator.LoadedAnimations.Equip then
			v30.Equipping = false;
		elseif v30.Viewmodel.Animator.LoadedAnimations.Equip.Length == 0 then
			v30.Viewmodel:Play("Equip", true);
			task.delay(v30.Viewmodel.Animator.LoadedAnimations.Equip.Length, function() --[[ Line: 692 ]]
				-- upvalues: v30 (read)
				v30.Equipping = false;
			end);
		end;
		v30.CachedFireEffects = v30.Viewmodel.Model.Main.Muzzle:GetDescendants();
		v30.MaxAmmo = l_Items_Loaded_0[l_Inventory_Loaded_0.MyInventory.Contents[v30.Viewmodel.Tool.Slot].Item].MaxAmmo;
		local v54 = l_Inventory_Loaded_0.MyInventory.Contents[v30.Viewmodel.Tool.Slot].Skin;
		local v55 = v54;
		if v54 then
			v55 = l_ReplicatedStorage_0.Assets.Skins.Tracers:FindFirstChild(l_Inventory_Loaded_0.MyInventory.Contents[v30.Viewmodel.Tool.Slot].Skin);
		end;
		v30.CustomTracer = v55;
	end;
end;
return v26;