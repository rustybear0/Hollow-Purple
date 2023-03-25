local TS = game:GetService("TweenService")
game.ReplicatedStorage.Input.OnServerEvent:Connect(function(Player, Input)
	local Character = Player.Character
	if Input == "HollowPurple" then
		local GUI = workspace.R6.Head.BillboardGui:Clone()
		GUI.Parent = Character.Head
		
		local MovementTween = TS:Create(Character.Humanoid,TweenInfo.new(1,Enum.EasingStyle.Cubic),{WalkSpeed = 0})
		MovementTween:Play()
		
		local BlueSFX = game.ServerStorage["Gojo Hollowed Purple (Blue)"]:Clone()
		BlueSFX.Parent = Character
		
		local RedSFX = game.ServerStorage["Gojo Hollowed Purple (Red)"]:Clone()
		RedSFX.Parent = Character
		
		local PurpleSFX = game.ServerStorage["Gojo Hollowed Purple (Purple)"]:Clone()
		PurpleSFX.Parent = Character
		
		spawn(function()
			StanceAnim = Character.Humanoid:LoadAnimation(game.ReplicatedStorage.PurpleStance)
			StanceAnim:Play()
			task.wait(27/60)
			StanceAnim:AdjustSpeed(0)
		end)
		BlueSFX:Play()
		spawn(function()
			local Text = "Cursed Technique Amplification: Blue"
			for i = 1, string.len(Text) do
				if GUI.Dialogue.Text == "Cursed Technique Amplification:" then
					task.wait(0.8)
				end
				GUI.Dialogue.Text = string.sub(Text,1,i)
				task.wait(0.025)
			end
		end)
		
		task.wait(2)
		local Blue = game.ServerStorage.Blue:Clone()
		Blue.Parent = workspace.ActiveVFX
		Blue.Transparency = 1
		Blue.PointLight.Brightness = 0
		Blue.CFrame = Character.HumanoidRootPart.CFrame * CFrame.new(-6.5,0,-4.5)
		Blue.Anchored = true
		
		local AppearBlue = TS:Create(Blue,TweenInfo.new(0.8,Enum.EasingStyle.Quad),{Transparency = 0})
		local AppearBlueLight = TS:Create(Blue.PointLight,TweenInfo.new(0.8,Enum.EasingStyle.Quad),{Brightness = 10})
		AppearBlue:Play()
		AppearBlueLight:Play()
		
		AppearBlue.Completed:Wait()
		
		RedSFX:Play()
		spawn(function()
			local Text = "Cursed Technique Reversal: Red"
			for i = 1, string.len(Text) do
				if GUI.Dialogue.Text == "Cursed Technique Reversal:" then
					task.wait(0.8)
				end
				GUI.Dialogue.Text = string.sub(Text,1,i)
				task.wait(0.025)
			end
		end)
		
		task.wait(1.8)
		local Red = game.ServerStorage.Red:Clone()
		Red.Parent = workspace.ActiveVFX
		Red.Transparency = 1
		Red.PointLight.Brightness = 0
		Red.CFrame = Character.HumanoidRootPart.CFrame * CFrame.new(6.5,0,-4.5)
		Red.Anchored = true

		local AppearRed = TS:Create(Red,TweenInfo.new(0.8,Enum.EasingStyle.Quad),{Transparency = 0})
		local AppearRedLight = TS:Create(Red.PointLight,TweenInfo.new(0.8,Enum.EasingStyle.Quad),{Brightness = 10})
		AppearRed:Play()
		AppearRedLight:Play()
		
		AppearRed.Completed:Wait()
		local CombineRed = TS:Create(Red,TweenInfo.new(2,Enum.EasingStyle.Quad),{CFrame = Character.HumanoidRootPart.CFrame * CFrame.new(0,0,-4.5)})
		local CombineBlue = TS:Create(Blue,TweenInfo.new(2,Enum.EasingStyle.Quad),{CFrame = Character.HumanoidRootPart.CFrame * CFrame.new(0,0,-4.5)})
		CombineRed:Play()
		CombineBlue:Play()
		GUI.Dialogue.Text = "..."
		
		local TransparencyBlue = TS:Create(Blue,TweenInfo.new(1,Enum.EasingStyle.Quad),{Transparency = 1})
		local TransparencyRed = TS:Create(Red,TweenInfo.new(1,Enum.EasingStyle.Quad),{Transparency = 1})
		local TransparencyBlueLight = TS:Create(Blue.PointLight,TweenInfo.new(1,Enum.EasingStyle.Quad),{Brightness = 0})
		local TransparencyRedLight = TS:Create(Red.PointLight,TweenInfo.new(1,Enum.EasingStyle.Quad),{Brightness = 0})
		task.wait(1)
		TransparencyBlue:Play()
		TransparencyRed:Play()
		TransparencyBlueLight:Play()
		TransparencyRedLight:Play()
		
		TransparencyBlue.Completed:Wait()
		
		local Purple = game.ServerStorage.HollowedPurple:Clone()
		Purple.Parent = workspace.ActiveVFX
		Purple.White.PointLight.Brightness = 0
		Purple.White.Anchored = true
		
		PurpleSFX:Play()
		spawn(function()
			StanceAnim:AdjustSpeed(1)
			task.wait(27.995/60)
			StanceAnim:AdjustSpeed(0)
			task.wait(1.8)
			StanceAnim:AdjustSpeed(1)
		end)
		spawn(function()
			task.wait(0.8)
			local Text = "Purple!"
			for i = 1, string.len(Text) do
				GUI.Dialogue.Text = string.sub(Text,1,i)
				task.wait(0.025)
			end
		end)
		
		for _, v in pairs(Purple:GetChildren()) do
			v.Transparency = 1
			v.CFrame = Character.HumanoidRootPart.CFrame * CFrame.new(0,8,-14)
			
			local Tween = TS:Create(v,TweenInfo.new(2,Enum.EasingStyle.Quad),{Transparency=0, Size = v.Size + Vector3.new(7.913,7.913,7.913)})
			Tween:Play()
		end
		
		task.wait(2)
		GUI:Destroy()
		Purple.White.Anchored = false
		local bv = Instance.new("BodyVelocity",Purple.White)
		local MovementTween = TS:Create(bv,TweenInfo.new(0.1,Enum.EasingStyle.Cubic),{Velocity = Character.HumanoidRootPart.CFrame.lookVector * 90})
		MovementTween:Play()
		bv.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
		Purple.White.lightning:Play()
		local TweenWalkSpeed = TS:Create(Character.Humanoid,TweenInfo.new(0.5,Enum.EasingStyle.Quad),{WalkSpeed = 16})
		TweenWalkSpeed:Play()
		
		task.wait(3)
		local SlowDownTween = TS:Create(bv,TweenInfo.new(3,Enum.EasingStyle.Quint),{Velocity = Character.HumanoidRootPart.CFrame.lookVector * 0})
		SlowDownTween:Play()
		for _, v in pairs(Purple:GetChildren()) do
			local TweenTransparency = TS:Create(v,TweenInfo.new(2,Enum.EasingStyle.Quint),{Transparency = 1})
			TweenTransparency:Play()
		end
		task.wait(2)
		Purple:Destroy()
	elseif Input == "Pipe" then
		local Pipe = game.ServerStorage.MetalPipe:Clone()
		Pipe.Parent = workspace
		Pipe.CFrame = Character.HumanoidRootPart.CFrame * CFrame.new(0,40,0)
		
		Pipe.Touched:Connect(function(hit)
			if hit.Parent:FindFirstChild("Humanoid") then
				if Pipe.metal_pipe.IsPlaying == false then
					Pipe.metal_pipe:Play()
					wait(0.2)
					local bv = Instance.new("BodyVelocity",Character.HumanoidRootPart)
					bv.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
					bv.Velocity = Vector3.new(math.random(90),math.random(90),math.random(90)) * 3
					task.wait(0.05)
					bv.MaxForce = Vector3.new(0,0,0)
					bv:Destroy()
					--hit.Parent.Humanoid:TakeDamage(1000)
				end
			end
		end)
	end
end)
