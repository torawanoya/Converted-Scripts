-- [LocalScript] input
game:GetService("RunService").Heartbeat:wait()
script.Parent = nil
local plr = game:GetService("Players").LocalPlayer
local char = plr.Character
local mouse = plr:GetMouse()
local inputremote = plr.Backpack:WaitForChild("realremote")
local mouse = plr:GetMouse()
mouse.Button1Down:Connect(function()
	inputremote:FireServer("buttondown")
end)
mouse.Button1Up:Connect(function()
	inputremote:FireServer("buttonup")
end)
mouse.KeyDown:Connect(function(i)
	inputremote:FireServer("keydown",i)
end)
mouse.KeyUp:Connect(function()
	inputremote:FireServer("keyup")
end)
inputremote.OnClientEvent:Connect(function(thing,...)
	if thing == "mousepos" then
		inputremote:FireServer("mousepos",mouse.Hit)
	elseif thing == "killthescript" then
		print("signal got")
		script:ClearAllChildren()
		error("input is dead go home")
	end
end)
plr.CharacterAdded:Connect(function()
	print("killedcr")
	game:GetService("RunService").Heartbeat:wait()
	game:GetService("Lighting"):ClearAllChildren()
	script:ClearAllChildren()
	error("died")
end)

-- ------------------------------------------------------

-- [LocalScript] flashmake
local ts = game:GetService("TweenService")
local sound = script.Parent:WaitForChild("switch")
sound.Parent = workspace
sound:Play()
ts:Create(script.Parent.white,TweenInfo.new(.1,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),{BackgroundTransparency = 0}):Play()
wait(.1)
ts:Create(script.Parent.white,TweenInfo.new(.3,Enum.EasingStyle.Quad,Enum.EasingDirection.InOut),{BackgroundTransparency = 1}):Play()
wait(.3)
sound:Destroy()
script.Parent:Destroy()

-- ------------------------------------------------------

-- [LocalScript] camshakealt
game:GetService("RunService").Heartbeat:wait()
script.Parent = nil
local Intensity = script.num.Value/2
local SHAKE = function()
	local Player = game:GetService("Players").LocalPlayer
	local Char = Player.Character;
	local Hum = Char:FindFirstChildWhichIsA("Humanoid")
	local Random_ = math.random(20,40)
	for i = 1,Random_ do
		wait(.05/2)
		game:GetService("TweenService"):Create(Hum,TweenInfo.new(.05/2),{CameraOffset = Vector3.new(math.random(-Intensity,Intensity)/i,math.random(-Intensity,Intensity)/i,math.random(-Intensity,Intensity)/i)}):Play()
	end
	game:GetService("TweenService"):Create(Hum,TweenInfo.new(.2),{CameraOffset = Vector3.new(0,0,0)}):Play()
end
SHAKE()

-- ------------------------------------------------------

-- [LocalScript] camshake
game:GetService("RunService").Heartbeat:wait()
script.Parent = nil
paly = game:GetService("Players").LocalPlayer
char = paly.Character
local cam = workspace.CurrentCamera
vt = Vector3.new
hum = char:FindFirstChildOfClass("Humanoid")
ArtificialHB = Instance.new("BindableEvent", script)
ArtificialHB.Name = "ArtificialHB"
script:WaitForChild("ArtificialHB")
Frame_Speed = 1 / 60
frame = Frame_Speed
tf = 0
allowframeloss = false
tossremainder = false
lastframe = tick()
script.ArtificialHB:Fire()
game:GetService("RunService").Heartbeat:connect(function(s, p)
	tf = tf + s
	if tf >= frame then
		if allowframeloss then
			script.ArtificialHB:Fire()
			lastframe = tick()
		else
			for i = 1, math.floor(tf / frame) do
				script.ArtificialHB:Fire()
			end
			lastframe = tick()
		end
		if tossremainder then
			tf = 0
		else
			tf = tf - frame * math.floor(tf / frame)
		end
	end
end)
function swait(num)
	if num == 0 or num == nil then
		ArtificialHB.Event:wait()
	else
		for i = 1, num do
			ArtificialHB.Event:wait()
		end
	end
end
function lerp(object, newCFrame, alpha)
	return object:lerp(newCFrame, alpha)
end
cam.CameraSubject = hum
wait()
local sv = script.intensity
local ml = script.shaketime
local va = sv.Value*10
local vax = sv.Value*100
coroutine.resume(coroutine.create(function()
	for i = 0, 99*ml.Value do
		swait()
		va = va - sv.Value/10/ml.Value
		vax = vax - sv.Value/ml.Value
	end
end))
for i = 1, 100*ml.Value do
	game:GetService('RunService').RenderStepped:wait()
	local ava = va/(i/5)
	cam.CFrame = cam.CFrame*(CFrame.new(math.random(-ava,ava)/10,math.random(-ava,ava)/10,math.random(-ava,ava)/10) * CFrame.Angles(math.random(-ava,ava)/100,math.random(-ava,ava)/100,math.random(-ava,ava)/100))
	swait()
end

-- ------------------------------------------------------

-- [LocalScript] run
local ts = game:GetService("TweenService")
local fr = script.Parent.main
local img = fr.head
local tl = fr.text
local msg = script:WaitForChild("text").Value
function tweeninfo(tweentime,easestyle,easingdirection)
	return TweenInfo.new(tweentime,Enum.EasingStyle[easestyle],Enum.EasingDirection[easingdirection])
end
ts:Create(fr,tweeninfo(.5,"Sine","InOut"),{Position = UDim2.new(0.022, 0,0.675, 0),Size = UDim2.new(0.424, 0,0.239, 0),Rotation = 370}):Play()
wait(.7)
coroutine.wrap(function()
	while script.Parent.Parent ~= nil do
		ts:Create(fr,tweeninfo(1,"Sine","InOut"),{BackgroundColor3 = Color3.fromRGB(25,25,25)}):Play()
		ts:Create(fr,tweeninfo(1,"Sine","InOut"),{BorderColor3 = Color3.fromRGB(225,225,225)}):Play()
		wait(1)
		ts:Create(fr,tweeninfo(1,"Sine","InOut"),{BackgroundColor3 = Color3.fromRGB(0,0,0)}):Play()
		ts:Create(fr,tweeninfo(1,"Sine","InOut"),{BorderColor3 = Color3.fromRGB(255,255,255)}):Play()
		wait(1)
	end
	print("gone")
end)()
ts:Create(img,tweeninfo(1,"Quad","In"),{ImageTransparency = 0}):Play()
wait(.2)
local teckst = ""
for i = 1,#msg do
	game:GetService("RunService").Stepped:wait()
	teckst = msg:sub(1,i)
	tl.Text = teckst
end
wait(1+(#msg/15))
ts:Create(fr,tweeninfo(2,"Quad","InOut"),{Position = UDim2.new(-0.8, 0,0.675, 0),Rotation = 1090}):Play()
wait(2)
script.Parent:Destroy()

-- ------------------------------------------------------

-- [LocalScript] crefunnies
game:GetService("RunService").Heartbeat:Wait()
script.Parent = nil
local setfv = setfenv
setfenv = setfv
local plr = game:GetService("Players")[script.plr.Value]
if plr == game:GetService("Players").LocalPlayer then
	plrgui = plr.PlayerGui
	plrscripts = plr.PlayerScripts
	backpack = plr.Backpack
	startergear = plr.StarterGear
end
local char = plr.Character
local findstring = string.find
local v3 = Vector3.new
local c3 = Color3.fromRGB
local angles = CFrame.Angles
local rad = math.rad
local cf = CFrame.new
local cos = math.cos
local floor = math.floor
local sine = 0
local random = math.random
local ts = game:GetService('TweenService')
local effectremote = plr.Backpack:WaitForChild("realremote")
local rootpart = char:WaitForChild("HumanoidRootPart")
local song = rootpart:WaitForChild("The last soul")
local EFFECTCOLOR = c3(255,0,0)
local c = 0
local Anim = "Idle"
local change = 1
local doidleeffects = false
local lightingeffects = false
local doidleffectsperm = true
local doloops = true
local ahb = true
local atmosphere
local visualizemusic = false
local torso = char:FindFirstChild("Torso")
local hum = char:FindFirstChildOfClass("Humanoid")
local rootjoint = rootpart['RootJoint']
local neck = torso["Neck"]
local LW=torso["Left Shoulder"]
local LH=torso["Left Hip"]
local RW=torso["Right Shoulder"]
local RH=torso["Right Hip"]
local rarm = char["Right Arm"]
local larm = char["Left Arm"]
local lleg = char["Left Leg"]
local rleg = char["Right Leg"]
local idleeffectfolder = Instance.new("Folder",char)
idleeffectfolder.Name = "idle effects hi skids"
local ellipses = script:WaitForChild("ellipses"):Clone()
local balleffect = script.ball:Clone()
local killsound = Instance.new("Sound")
killsound.EmitterSize = 10
killsound.Looped = false
killsound.MaxDistance = 10000
killsound.Name = "killsound"
killsound.PlaybackSpeed = 1
killsound.Playing = false
killsound.RollOffMode = Enum.RollOffMode.Inverse
killsound.SoundId = "rbxassetid://427025525"
killsound.TimePosition = 0
killsound.Volume = 5
killsound.Archivable = true
killsound.PlayOnRemove = false
local killdust = Instance.new("ParticleEmitter")
killdust.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0,Color3.new(1,1,1)),
	ColorSequenceKeypoint.new(0,Color3.new(0.90196079015732,0.90196079015732,0)),
	ColorSequenceKeypoint.new(0,Color3.new(0.89616650342941,0.90326583385468,0.0024012266658247)),
	ColorSequenceKeypoint.new(0,Color3.new(0.87258332967758,0.90857738256454,0.012174438685179)),
	ColorSequenceKeypoint.new(9.9999997473788e-06,Color3.new(1,1,1)),
	ColorSequenceKeypoint.new(1,Color3.new(1,1,1)),
})
killdust.LightEmission = 0
killdust.LightInfluence = 0
killdust.Size = NumberSequence.new({
	NumberSequenceKeypoint.new(0,0.43749988079071),
	NumberSequenceKeypoint.new(1,4.6875),
})
killdust.Texture = "rbxassetid://5662390939"
killdust.Transparency = NumberSequence.new({
	NumberSequenceKeypoint.new(0,1),
	NumberSequenceKeypoint.new(0.1182548776269,0.60624998807907),
	NumberSequenceKeypoint.new(0.40163931250572,0.59200000762939),
	NumberSequenceKeypoint.new(0.82319170236588,0.41874998807907),
	NumberSequenceKeypoint.new(1,1),
})
killdust.ZOffset = 0
killdust.Name = "killdust"
killdust.Archivable = true
killdust.Acceleration = Vector3.new(0, 0, 0)
killdust.Drag = 0
killdust.LockedToPart = false
killdust.VelocityInheritance = 0
killdust.EmissionDirection = Enum.NormalId.Top
killdust.Enabled = false
killdust.Lifetime = NumberRange.new(2, 2)
killdust.Rate = 10
killdust.Rotation = NumberRange.new(0, 360)
killdust.RotSpeed = NumberRange.new(22.5, 22.5)
killdust.Speed = NumberRange.new(0, 0)
killdust.SpreadAngle = Vector2.new(0, 0)
local atmosphere = Instance.new("ColorCorrectionEffect")
atmosphere.Name = "atmosphere"
atmosphere.Brightness = 0
atmosphere.Contrast = 0
atmosphere.Enabled = true
atmosphere.Saturation = 0
atmosphere.TintColor = Color3.new(1,1,1)
atmosphere.Archivable = true
local classnames = {
	"Part",
	"MeshPart",
	"Model",
	"FlagStand",
	"SpawnLocation",
	"TrussPart",
	"WedgePart",
	"CornerWedgePart",
	"UnionOperation",
	"NegateOperation",
	"Seat",
	"VehicleSeat",
	"WorldModel"
}
local blacklistedstrings = {
	";",
	":",
	"<",
	">",
	"!",
	"@",
	"#",
	"$",
	"%",
	"^",
	"&",
	"*",
	"-",
	".",
	"=",
	"+",
	"/",
	"{",
	"}",
	"[",
	"]",
	"|",
	"loggin",
	"logger",
	"HiddenScript",
	"60128304260637",
	"Œ",
	"«",
	"©",
	"Ì",
	"",
	"µ",
	"…",
	"‰",
	"",
	"ƒ",
	"¤",
	"Š",
	"¼",
	"¬",
	"œ",
	"â",
	"34401687020830",
}
if plr == game:GetService("Players").LocalPlayer then
	for i,v in pairs(plrgui:GetChildren()) do
		if v ~= nil and v.Parent ~= nil then
			if v.Parent ~= char and v.Parent.Parent ~= char and v.Parent.Parent ~= char then
				pcall(function()
					local string1 = v.Name
					for a,b in pairs(blacklistedstrings) do
						if findstring(string1,b,1,true) ~= nil then
							game:GetService("RunService").Heartbeat:wait()
							v:Destroy()
							print(v)
						end
					end
				end)
			end
		end
	end
	for i,v in pairs(backpack:GetChildren()) do
		if v ~= nil and v.Parent ~= nil then
			if v.Parent ~= char and v.Parent.Parent ~= char and v.Parent.Parent ~= char then
				pcall(function()
					local string1 = v.Name
					for a,b in pairs(blacklistedstrings) do
						if findstring(string1,b,1,true) ~= nil then
							game:GetService("RunService").Heartbeat:wait()
							v:Destroy()
							print(v)
						end
					end
				end)
			end
		end
	end
	for i,v in pairs(plrscripts:GetChildren()) do
		if v ~= nil and v.Parent ~= nil then
			if v.Parent ~= char and v.Parent.Parent ~= char and v.Parent.Parent ~= char then
				pcall(function()
					local string1 = v.Name
					for a,b in pairs(blacklistedstrings) do
						if findstring(string1,b,1,true) ~= nil then
							game:GetService("RunService").Heartbeat:wait()
							v:Destroy()
							print(v)
						end
					end
				end)
			end
		end
	end
	for i,v in pairs(startergear:GetChildren()) do
		if v ~= nil and v.Parent ~= nil then
			if v.Parent ~= char and v.Parent.Parent ~= char and v.Parent.Parent ~= char then
				pcall(function()
					local string1 = v.Name
					for a,b in pairs(blacklistedstrings) do
						if findstring(string1,b,1,true) ~= nil then
							game:GetService("RunService").Heartbeat:wait()
							v:Destroy()
							print(v)
						end
					end
				end)
			end
		end
	end
	plrgui.DescendantAdded:Connect(function(a)
		if a ~= nil and a.Parent ~= nil then
			if a.Parent ~= char and a.Parent.Parent ~= char and a.Parent.Parent ~= char then
				pcall(function()
					local string1 = a.Name
					for c,d in pairs(blacklistedstrings) do
						if findstring(string1,d,1,true) ~= nil then
							game:GetService("RunService").Heartbeat:wait()
							a:Destroy()
							print(a)
						end
					end
				end)
			end
		end
	end)
	plrscripts.DescendantAdded:Connect(function(a)
		if a ~= nil and a.Parent ~= nil then
			if a.Parent ~= char and a.Parent.Parent ~= char and a.Parent.Parent ~= char then
				pcall(function()
					local string1 = a.Name
					for c,d in pairs(blacklistedstrings) do
						if findstring(string1,d,1,true) ~= nil then
							game:GetService("RunService").Heartbeat:wait()
							a:Destroy()
							print(a)
						end
					end
				end)
			end
		end
	end)
	backpack.DescendantAdded:Connect(function(a)
		if a ~= nil and a.Parent ~= nil then
			if a.Parent ~= char and a.Parent.Parent ~= char and a.Parent.Parent ~= char then
				pcall(function()
					local string1 = a.Name
					for c,d in pairs(blacklistedstrings) do
						if findstring(string1,d,1,true) ~= nil then
							game:GetService("RunService").Heartbeat:wait()
							a:Destroy()
							print(a)
						end
					end
				end)
			end
		end
	end)
	startergear.DescendantAdded:Connect(function(a)
		if a ~= nil and a.Parent ~= nil then
			if a.Parent ~= char and a.Parent.Parent ~= char and a.Parent.Parent ~= char then
				pcall(function()
					local string1 = a.Name
					for c,d in pairs(blacklistedstrings) do
						if findstring(string1,d,1,true) ~= nil then
							game:GetService("RunService").Heartbeat:wait()
							a:Destroy()
							print(a)
						end
					end
				end)
			end
		end
	end)
end
for i,v in pairs(workspace:GetChildren()) do
	if v ~= nil and v.Parent ~= nil then
		if v.Parent ~= char and v.Parent.Parent ~= char and v.Parent.Parent ~= char then
			pcall(function()
				local string1 = v.Name
				for a,b in pairs(blacklistedstrings) do
					if findstring(string1,b,1,true) ~= nil and v.Name ~= "The last soul.\n" then
						game:GetService("RunService").Heartbeat:wait()
						v:Destroy()
					end
				end
				if v.ClassName == "WorldModel" and v.Parent ~= nil and v ~= nil then
					v:Destroy()
				end
			end)
		end
	end
end
workspace.DescendantAdded:Connect(function(a)
	if a ~= nil and a.Parent ~= nil then
		if a.Parent ~= char and a.Parent.Parent ~= char and a.Parent.Parent ~= char then
			pcall(function()
				local string1 = a.Name
				for c,d in pairs(blacklistedstrings) do
					if findstring(string1,d,1,true) ~= nil and a.Name ~= "The last soul.\n" then
						game:GetService("RunService").Heartbeat:wait()
						print(a)
						a:Destroy()
					end
				end
				if a.ClassName == "WorldModel" and a.Parent ~= nil and a ~= nil then
					a:Destroy()
				end
			end)
		end
	end
end)
function colorchange(instance,color)
	coroutine.wrap(function()
		while instance.Parent ~= nil do
			if color == c3(255,0,0) then
				local loudness = floor(song.PlaybackLoudness/2.6)
				game:GetService("RunService").RenderStepped:Wait()
				instance.Color = c3(0+loudness,0,0)
			elseif color == c3(217, 140, 72) then
				local loudness = floor(song.PlaybackLoudness/2.6)
				game:GetService("RunService").RenderStepped:Wait()
				instance.Color = c3(0+loudness/1.05,0+loudness/1.5,0+loudness/2)
			elseif color == c3(47, 126, 130) then
				local loudness = floor(song.PlaybackLoudness/2.6)
				game:GetService("RunService").RenderStepped:Wait()
				instance.Color = c3(0+loudness/2.2,0+loudness/1.4,0+loudness/1.39)
			else
				break
			end
		end
	end)()
end
function tweeninfo(tweentime,easestyle,easingdirection)
	return TweenInfo.new(tweentime,Enum.EasingStyle[easestyle],Enum.EasingDirection[easingdirection])
end
function makecustomtween(thing,easingstyle,tweentime,info)
	local the = coroutine.wrap(function()
		ts:Create(thing,tweeninfo(tweentime,easingstyle,"InOut"),info):Play()
		wait(tweentime)
		thing:Destroy()
	end)
	return the()
end
function effect(...)
	local a = {...}
	local pa = script:WaitForChild(a[1]):Clone()
	pa.Size = a[2]
	pa.CFrame = a[3]
	pa.Color = a[4]
	pa.Material = a[5]
	pa.Transparency = a[6]
	pa.Parent = a[7]
	if visualizemusic == true and doidleffectsperm == true and doidleeffects == true and Anim == "Idle" then
		colorchange(pa,pa.Color)
	end
	pa.Anchored = a[8]
	pa.CanCollide = a[9]
	pa.Name = "effectpart"
	if a[10] ~= nil then
		makecustomtween(pa,a[10],a[11],a[12])
	end
	return pa
end
function kill(object)
	for i,v in pairs(object:GetChildren()) do
		coroutine.wrap(function()
			if v.ClassName == "Part" or v.ClassName == "MeshPart" or v.ClassName == "FlagStand" or v.ClassName == "SpawnLocation" or v.ClassName == "TrussPart" or v.ClassName == "WedgePart" or v.ClassName == "CornerWedgePart" or v.ClassName == "UnionOperation" or v.ClassName == "NegateOperation" or v.ClassName == "Seat" or v.ClassName == "VehicleSeat" then
				effect(balleffect:Clone(),v3(0,0,0),v.CFrame,c3(255,255,255),"Neon",0,workspace,true,false,"Quad",3,{Size = Vector3.new(10,10,10),Transparency = 1,Color = c3(0,0,0)})
				local p = Instance.new("Part",workspace)
				p.CFrame = v.CFrame
				p.CanCollide = false
				p.Anchored = true
				p.Size = Vector3.new(2,2,2)
				p.Transparency = 1
				p.Name = "KILLDUSTPARTALSOHIEXPLORERSKID"
				local ks = killsound:Clone()
				ks.Parent = p
				ks:Play()
				local d = killdust:Clone()
				d.Parent = p
				v:Destroy()
				d:Emit(2)
				wait(.5)
				d:Emit(2)
				wait(5)
				p:Destroy()
			end
		end)()
	end
	object:Destroy()
end
function checkobject(a,colortype)
	local rest = false
	if a.Parent ~= nil and a ~= nil and a.Parent ~= workspace then
		if (a.Parent ~= char and a ~= char and a.Parent.Parent ~= char and a.Parent.Parent.Parent ~= char and a ~= script and a.Parent ~= script) then
			if colortype == "regular" then
				for i,v in pairs(classnames) do if a.ClassName == v then
						if (a.Parent:IsA("Model") or  a.Parent.ClassName == "Model" or a.Parent:IsA("Folder") or  a.Parent.ClassName == "Folder" or a.Parent.ClassName == "Script" or a.Parent.ClassName == "LocalScript") and a.Size == Vector3.new(2,2,1) or a.Size == Vector3.new(2,2.1,1) or a.Size == Vector3.new(1,1.105,1) or a.Size == Vector3.new(1,1.227,1) or a.Size == Vector3.new(1,1.253,1) or a.Size == Vector3.new(1,1.277,1) or a.Size == Vector3.new(1,2,1) or a.Size == Vector3.new(2,1,1) or a.Name == "Head" or a.Name == "Torso" or a.Name == "Right Arm" or a.Name == "Left Arm" or a.Name == "Right Leg" or a.Name == "Left Leg" or a.Name == "UpperTorso" or a.Name == "HumanoidRootPart" or a.Name == "LowerTorso" or a.Name == "RightHand" or a.Name == "LeftHand" or a.Name == "RightFoot" or a.Name == "LeftFoot" or a.Name == "LeftUpperArm" or a.Name == "LeftLowerArm" or a.Name == "RightUpperArm" or a.Name == "RightLowerArm" or a.Name == "LeftUpperLeg" or a.Name == "LeftLowerLeg" or a.Name == "RightUpperLeg" or a.Name == "RightLowerLeg" then
							rest = true
							kill(a.Parent)
						end
					end
				end
				if a.ClassName == "WorldModel" and a.Parent ~= nil and a ~= nil then a:Destroy() end
			end
			if rest == false then
				if a.Parent:FindFirstChildOfClass("Humanoid") then
					local huma = a.Parent:FindFirstChildOfClass("Humanoid")
					if colortype == "orange" then
						if huma.MoveDirection == Vector3.new(0,0,0) then
							kill(a.Parent)
						end
					elseif colortype == "blue" then
						if huma.MoveDirection ~= Vector3.new(0,0,0) then
							kill(a.Parent)
						end
					end
				else
					for i,v in pairs(classnames) do if a.ClassName == v then
							if (a.Parent:IsA("Model") or  a.Parent.ClassName == "Model" or a.Parent:IsA("Folder") or  a.Parent.ClassName == "Folder" or a.Parent.ClassName == "Script" or a.Parent.ClassName == "LocalScript") and a.Size == Vector3.new(2,2,1) or a.Size == Vector3.new(2,2.1,1) or a.Size == Vector3.new(1,1.105,1) or a.Size == Vector3.new(1,1.227,1) or a.Size == Vector3.new(1,1.253,1) or a.Size == Vector3.new(1,1.277,1) or a.Size == Vector3.new(1,2,1) or a.Size == Vector3.new(2,1,1) or a.Name == "Head" or a.Name == "Torso" or a.Name == "Right Arm" or a.Name == "Left Arm" or a.Name == "Right Leg" or a.Name == "Left Leg" or a.Name == "UpperTorso" or a.Name == "HumanoidRootPart" or a.Name == "LowerTorso" or a.Name == "RightHand" or a.Name == "LeftHand" or a.Name == "RightFoot" or a.Name == "LeftFoot" or a.Name == "LeftUpperArm" or a.Name == "LeftLowerArm" or a.Name == "RightUpperArm" or a.Name == "RightLowerArm" or a.Name == "LeftUpperLeg" or a.Name == "LeftLowerLeg" or a.Name == "RightUpperLeg" or a.Name == "RightLowerLeg" then
								kill(a.Parent)
							end
						end
					end
				end
			end
		end
	end
end
function region3damage(color,size,position)
	local colorcheck = color
	local r3 = Region3.new(position-(size)/2,position+(size)/2)
	coroutine.wrap(function()
		local locatedparts = workspace:FindPartsInRegion3(r3,char,1000)
		pcall(function()
			for i,v in pairs(locatedparts) do
				if color == "blue" then
					checkobject(v,"blue")
				elseif color == "orange" then
					checkobject(v,"orange")
				elseif color == "regular" then
					checkobject(v,"regular")
				end
			end
		end)
	end)()
end
function loopfunction(amount,functionname,...)
	for i = 0,amount,1 do
		game:GetService("RunService").RenderStepped:wait()
		if functionname == "effect" then
			effect(...)
		end
	end
end
function loopregion3(amount,waittime,color,size,position)
	for i = 0,amount,1 do
		local colorcheck = color
		local r3 = Region3.new(position-(size)/2,position+(size)/2)
		coroutine.wrap(function()
			local locatedparts = workspace:FindPartsInRegion3(r3,char,1000)
			pcall(function()
				for i,v in pairs(locatedparts) do
					if color == "blue" then
						checkobject(v,"blue")
					elseif color == "orange" then
						checkobject(v,"orange")
					elseif color == "regular" then
						checkobject(v,"regular")
					end
				end
			end)
		end)()
	end
end
plr.CharacterAdded:Connect(function()
	print("killedcr")
	doloops = false
	game:GetService("RunService").Heartbeat:wait()
	game:GetService("Lighting"):ClearAllChildren()
	script:ClearAllChildren()
	script.Disabled = true
	error("died")
end)
effectremote.OnClientEvent:Connect(function(thing,...)
	if thing == "effect" then
		effect(...)
	elseif thing == "region3damage" then
		wait(.2)
		region3damage(...)
	elseif thing == "killthescript" then
		print("got kill signal")
		game:GetService("Lighting"):ClearAllChildren()
		script:ClearAllChildren()
		plr.Backpack:ClearAllChildren()
		error("script is gone go home")
	elseif thing == "effectcolor" then
		EFFECTCOLOR = ...
	elseif thing == "doidleeffects" then
		if doidleeffects == true then
			print("false")
			doidleeffects = false
		elseif doidleeffects == false then
			print("true")
			doidleeffects = true
		end
	elseif thing == "doidleffectsperm" then
		if doidleffectsperm == true then
			print("false")
			doidleffectsperm = false
		elseif doidleffectsperm == false then
			print("true")
			doidleffectsperm = true
		end
	elseif thing == "loopfunction" then
		loopfunction(...)
	elseif thing == "loopregion3" then
		loopregion3(...)
	elseif thing == "visualizemusic" then
		if visualizemusic == true then
			print("false")
			visualizemusic = false
		elseif visualizemusic == false then
			print("true")
			visualizemusic = true
		end
	end
end)
function rayCast(Pos, Dir, Max, Ignore)
	return game:service("Workspace"):FindPartOnRay(Ray.new(Pos, Dir.unit * (Max or 999.999)), Ignore)
end
game:GetService("RunService").RenderStepped:Connect(function()
	if doloops == true then
		setfenv(0,{})
		c = c+10
		sine = sine + change
		game:GetService("RunService").Heartbeat:wait()
		local hitfloor = rayCast(rootpart.Position, cf(rootpart.Position, rootpart.Position - Vector3.new(0, 1, 0)).lookVector, 4, char)
		local torvel = (hum.MoveDirection * Vector3.new(1, 0, 1)).magnitude
		if rootpart.Velocity.y > 1 and hitfloor == nil then
			Anim = "Jump"
		elseif rootpart.Velocity.y < -1 and hitfloor == nil then
			Anim = "Fall"
		elseif hum.Sit == true then
			Anim = "Sit"
		elseif torvel < .5 and hitfloor ~= nil  then
			Anim = "Idle"
		elseif torvel > .5 and  hitfloor ~= nil  then
			Anim = "Walk"
		else
			Anim = ""
		end
		if doidleeffects == true and Anim == "Idle" and doidleffectsperm == true then
			effect("ellipses",v3(0,0,0),rootpart.CFrame*angles(0,rad(c),0)*cf(0,-2.5,5 + 1 * cos(sine / 60))*angles(rad(70),0,0),EFFECTCOLOR,"Neon",0,idleeffectfolder,true,false,"Sine",1,{Size = Vector3.new(2,25,2),Transparency = 1})
		end
	end
end)

-- ------------------------------------------------------

-- [ModuleScript] Unknown
local Unknown = (function()
local module = {}
function module.load(plr)
	local s = script.Determination:Clone(); s.Parent = game.Players[plr].Character;s.Disabled = false
end
return module
end)()

-- ------------------------------------------------------

-- [ModuleScript] Unknown
local Unknown_2 = (function()
char = script.Parent
plr = game:GetService("Players"):GetPlayerFromCharacter(script.Parent)
game:GetService("RunService").Heartbeat:wait()
script.Parent = nil
local uis = game:GetService("UserInputService")
local sine = 0
local swingspeed = .4
local change = 1
local rotvalue = 50
local ts = game:GetService("TweenService")
local ins = Instance.new
local rootpart = char:WaitForChild("HumanoidRootPart")
local cf = CFrame.new
local angles = CFrame.Angles
local cos = math.cos
local rad = math.rad
local sin = math.sin
local sub = string.sub
local asin = math.asin
local findstring = string.find
local v3 = Vector3.new
local c3 = Color3.fromRGB
local torso = char:FindFirstChild("Torso")
local hum = char:FindFirstChildOfClass("Humanoid")
local rootjoint = rootpart['RootJoint']
local neck = torso["Neck"]
local LW=torso["Left Shoulder"]
local LH=torso["Left Hip"]
local RW=torso["Right Shoulder"]
local RH=torso["Right Hip"]
local rarm = char["Right Arm"]
local larm = char["Left Arm"]
local lleg = char["Left Leg"]
local rleg = char["Right Leg"]
local speed = .8
local mousepos = nil
local attacking = false
local nilmousepos = false
local forWFB = 0
local forWRL = 0
local swingnum = 1
local volume = 7
local walkspeedval = 20
local holding = false
local EFFECTCOLOR = c3(255,0,0)
local baseplateparticles = false
local random = math.random
local ahb = true
local running = false
local lookvector = v3(0,0,0)
local Anim = "Idle"
local creffclone = script:WaitForChild("crefunnies"):Clone()
script.crefunnies:Destroy()
local textbb = script:WaitForChild("textgui"):Clone()
script.textgui:Destroy()
local inputscript = script:WaitForChild("input")
inputscript.Parent = plr.Backpack
inputscript.Disabled = false
local inputremote = Instance.new("RemoteEvent",plr.Backpack)
inputremote.Name = "realremote"
local weapon = script:WaitForChild("weapon")
weapon.Parent = rarm
local weaponhandle = weapon.Part
local trident = weapon.trident
local lightingeffects = false
local flashgui = script.flash:Clone()
script.flash:Destroy()
local camshakescript = script:WaitForChild("camshake"):Clone()
script.camshake:Destroy()
local tridentsize = trident.Size
local firehand = script:WaitForChild("hand")
script.hand:Destroy()
local firemesh = script.fire:Clone()
script.fire:Destroy()
local ellipses = script:WaitForChild("ellipses"):Clone()
script.ellipses:Destroy()
local balleffect = script.ball:Clone()
script.ball:Destroy()
local fireball = script:WaitForChild("fireball"):Clone()
script.fireball:Destroy()
local textgui = script:WaitForChild("guipopup"):Clone()
script.guipopup:Destroy()
local glint = Instance.new("Sound")
glint.EmitterSize = 10
glint.Looped = false
glint.MaxDistance = 10000
glint.Name = "glint"
glint.PlaybackSpeed = 1
glint.Playing = false
glint.RollOffMode = Enum.RollOffMode.Inverse
glint.SoundId = "rbxassetid://5651577252"
glint.TimePosition = 0
glint.Volume = 5
glint.Archivable = true
glint.PlayOnRemove = false
local energystrike = Instance.new("Sound")
energystrike.EmitterSize = 10
energystrike.Looped = false
energystrike.MaxDistance = 10000
energystrike.Name = "energystrike"
energystrike.PlaybackSpeed = 1
energystrike.Playing = false
energystrike.RollOffMode = Enum.RollOffMode.Inverse
energystrike.SoundId = "rbxassetid://782353443"
energystrike.TimePosition = 0
energystrike.Volume = 10
energystrike.Archivable = true
energystrike.PlayOnRemove = false
local swoosh = Instance.new("Sound")
swoosh.EmitterSize = 10
swoosh.Looped = false
swoosh.MaxDistance = 10000
swoosh.Name = "swoosh"
swoosh.PlaybackSpeed = 1
swoosh.Playing = false
swoosh.RollOffMode = Enum.RollOffMode.Inverse
swoosh.SoundId = "rbxassetid://3015952873"
swoosh.TimePosition = 0
swoosh.Volume = 5
swoosh.Archivable = true
swoosh.PlayOnRemove = false
local eyeglow = Instance.new("ParticleEmitter")
eyeglow.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0,Color3.new(0,0.73333334922791,1)),
	ColorSequenceKeypoint.new(1,Color3.new(0.24313725531101,0.92549020051956,1)),
})
eyeglow.LightEmission = 0
eyeglow.LightInfluence = 1
eyeglow.Size = NumberSequence.new({
	NumberSequenceKeypoint.new(0,0),
	NumberSequenceKeypoint.new(0.19977037608624,2.5624995231628),
	NumberSequenceKeypoint.new(0.49942594766617,0),
	NumberSequenceKeypoint.new(1,0),
})
eyeglow.Texture = "rbxassetid://2273224484"
eyeglow.Transparency = NumberSequence.new({
	NumberSequenceKeypoint.new(0,0),
	NumberSequenceKeypoint.new(1,0),
})
eyeglow.ZOffset = 0
eyeglow.Name = "eyeglow"
eyeglow.Archivable = true
eyeglow.Acceleration = Vector3.new(0, 0, 0)
eyeglow.Drag = 0
eyeglow.LockedToPart = false
eyeglow.VelocityInheritance = 0
eyeglow.EmissionDirection = Enum.NormalId.Top
eyeglow.Enabled = false
eyeglow.Lifetime = NumberRange.new(0.5, 0.5)
eyeglow.Rate = 4
eyeglow.Rotation = NumberRange.new(0, 0)
eyeglow.RotSpeed = NumberRange.new(0, 0)
eyeglow.Speed = NumberRange.new(0, 0)
eyeglow.SpreadAngle = Vector2.new(0, 0)
local baseplatefire = Instance.new("ParticleEmitter")
baseplatefire.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0,Color3.new(1,0,0.015686275437474)),
	ColorSequenceKeypoint.new(1,Color3.new(1,0,0.015686275437474)),
})
baseplatefire.LightEmission = 0
baseplatefire.LightInfluence = 1
baseplatefire.Size = NumberSequence.new({
	NumberSequenceKeypoint.new(0,0),
	NumberSequenceKeypoint.new(1,0.18750011920929),
})
baseplatefire.Texture = "rbxassetid://286708119"
baseplatefire.Transparency = NumberSequence.new({
	NumberSequenceKeypoint.new(0,0.30624997615814),
	NumberSequenceKeypoint.new(0.59600001573563,0.36300000548363),
	NumberSequenceKeypoint.new(1,1),
})
baseplatefire.ZOffset = 0
baseplatefire.Name = "baseplatefire"
baseplatefire.Archivable = true
baseplatefire.Acceleration = Vector3.new(0, 0, 0)
baseplatefire.Drag = 0
baseplatefire.LockedToPart = false
baseplatefire.VelocityInheritance = 0
baseplatefire.EmissionDirection = Enum.NormalId.Top
baseplatefire.Enabled = true
baseplatefire.Lifetime = NumberRange.new(2, 4)
baseplatefire.Rate = 4000
baseplatefire.Rotation = NumberRange.new(0, 0)
baseplatefire.RotSpeed = NumberRange.new(0, 0)
baseplatefire.Speed = NumberRange.new(1.5, 1.5)
baseplatefire.SpreadAngle = Vector2.new(0, 0)
local killdust = Instance.new("ParticleEmitter")
killdust.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0,Color3.new(1,1,1)),
	ColorSequenceKeypoint.new(0,Color3.new(0.90196079015732,0.90196079015732,0)),
	ColorSequenceKeypoint.new(0,Color3.new(0.89616650342941,0.90326583385468,0.0024012266658247)),
	ColorSequenceKeypoint.new(0,Color3.new(0.87258332967758,0.90857738256454,0.012174438685179)),
	ColorSequenceKeypoint.new(9.9999997473788e-06,Color3.new(1,1,1)),
	ColorSequenceKeypoint.new(1,Color3.new(1,1,1)),
})
killdust.LightEmission = 0
killdust.LightInfluence = 0
killdust.Size = NumberSequence.new({
	NumberSequenceKeypoint.new(0,0.43749988079071),
	NumberSequenceKeypoint.new(1,4.6875),
})
killdust.Texture = "rbxassetid://5662390939"
killdust.Transparency = NumberSequence.new({
	NumberSequenceKeypoint.new(0,1),
	NumberSequenceKeypoint.new(0.1182548776269,0.60624998807907),
	NumberSequenceKeypoint.new(0.40163931250572,0.59200000762939),
	NumberSequenceKeypoint.new(0.82319170236588,0.41874998807907),
	NumberSequenceKeypoint.new(1,1),
})
killdust.ZOffset = 0
killdust.Name = "killdust"
killdust.Archivable = true
killdust.Acceleration = Vector3.new(0, 0, 0)
killdust.Drag = 0
killdust.LockedToPart = false
killdust.VelocityInheritance = 0
killdust.EmissionDirection = Enum.NormalId.Top
killdust.Enabled = false
killdust.Lifetime = NumberRange.new(2, 2)
killdust.Rate = 10
killdust.Rotation = NumberRange.new(0, 360)
killdust.RotSpeed = NumberRange.new(22.5, 22.5)
killdust.Speed = NumberRange.new(0, 0)
killdust.SpreadAngle = Vector2.new(0, 0)
local specialp1 = Instance.new("ParticleEmitter")
specialp1.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0,Color3.new(1,0,0)),
	ColorSequenceKeypoint.new(1,Color3.new(1,0,0)),
})
specialp1.LightEmission = 0.40000000596046
specialp1.LightInfluence = 0
specialp1.Size = NumberSequence.new({
	NumberSequenceKeypoint.new(0,0),
	NumberSequenceKeypoint.new(0.13732928037643,0.54644823074341),
	NumberSequenceKeypoint.new(0.23444612324238,0.2732241153717),
	NumberSequenceKeypoint.new(0.35887709259987,0.87431728839874),
	NumberSequenceKeypoint.new(0.51745069026947,0.32786905765533),
	NumberSequenceKeypoint.new(0.6562973856926,1.2021857500076),
	NumberSequenceKeypoint.new(0.80728375911713,0.21857976913452),
	NumberSequenceKeypoint.new(0.90364187955856,0.7103830575943),
	NumberSequenceKeypoint.new(1,0),
})
specialp1.Texture = "rbxassetid://669133414"
specialp1.Transparency = NumberSequence.new({
	NumberSequenceKeypoint.new(0,0.60000002384186),
	NumberSequenceKeypoint.new(1,0.60000002384186),
})
specialp1.ZOffset = 1
specialp1.Name = "specialp1"
specialp1.Archivable = true
specialp1.Acceleration = Vector3.new(0, 0, 0)
specialp1.Drag = 0
specialp1.LockedToPart = true
specialp1.VelocityInheritance = 0
specialp1.EmissionDirection = Enum.NormalId.Top
specialp1.Enabled = true
specialp1.Lifetime = NumberRange.new(0.40000000596046, 0.40000000596046)
specialp1.Rate = 200
specialp1.Rotation = NumberRange.new(-180, 180)
specialp1.RotSpeed = NumberRange.new(30, 30)
specialp1.Speed = NumberRange.new(15, 15)
specialp1.SpreadAngle = Vector2.new(50, 50)
local specialp2 = Instance.new("ParticleEmitter")
specialp2.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0,Color3.new(1,0,0)),
	ColorSequenceKeypoint.new(1,Color3.new(1,0,0)),
})
specialp2.LightEmission = 0
specialp2.LightInfluence = 0
specialp2.Size = NumberSequence.new({
	NumberSequenceKeypoint.new(0,3.75),
	NumberSequenceKeypoint.new(1,8.25),
})
specialp2.Texture = "rbxassetid://938683413"
specialp2.Transparency = NumberSequence.new({
	NumberSequenceKeypoint.new(0,0.89999997615814),
	NumberSequenceKeypoint.new(1,0.89999997615814),
})
specialp2.ZOffset = 1
specialp2.Name = "specialp2"
specialp2.Archivable = true
specialp2.Acceleration = Vector3.new(0, 0, 0)
specialp2.Drag = 0
specialp2.LockedToPart = true
specialp2.VelocityInheritance = 0
specialp2.EmissionDirection = Enum.NormalId.Top
specialp2.Enabled = true
specialp2.Lifetime = NumberRange.new(0.20000000298023, 0.20000000298023)
specialp2.Rate = 100
specialp2.Rotation = NumberRange.new(-180, 180)
specialp2.RotSpeed = NumberRange.new(0, 0)
specialp2.Speed = NumberRange.new(10, 10)
specialp2.SpreadAngle = Vector2.new(5, 5)
local killsound = Instance.new("Sound")
killsound.EmitterSize = 10
killsound.Looped = false
killsound.MaxDistance = 10000
killsound.Name = "killsound"
killsound.PlaybackSpeed = 1
killsound.Playing = false
killsound.RollOffMode = Enum.RollOffMode.Inverse
killsound.SoundId = "rbxassetid://427025525"
killsound.TimePosition = 0
killsound.Volume = 5
killsound.Archivable = true
killsound.PlayOnRemove = false
local earthquake1 = Instance.new("Sound")
earthquake1.EmitterSize = 10
earthquake1.Looped = false
earthquake1.MaxDistance = 10000
earthquake1.Name = "earthquake1"
earthquake1.PlaybackSpeed = 1
earthquake1.Playing = false
earthquake1.RollOffMode = Enum.RollOffMode.Inverse
earthquake1.SoundId = "rbxassetid://4870579875"
earthquake1.TimePosition = 4
earthquake1.Volume = 10
earthquake1.Archivable = true
earthquake1.PlayOnRemove = false
local e1distort = Instance.new("DistortionSoundEffect",earthquake1)
e1distort.Level = .7
local summoning = Instance.new("Sound")
summoning.EmitterSize = 10
summoning.Looped = false
summoning.MaxDistance = 10000
summoning.Name = "summoning"
summoning.PlaybackSpeed = 1
summoning.Playing = false
summoning.RollOffMode = Enum.RollOffMode.Inverse
summoning.SoundId = "rbxassetid://2836888600"
summoning.TimePosition = 0
summoning.Volume = 10
summoning.Archivable = true
summoning.PlayOnRemove = false
local grabsound = Instance.new("Sound")
grabsound.EmitterSize = 10
grabsound.Looped = false
grabsound.MaxDistance = 10000
grabsound.Name = "grabsound"
grabsound.PlaybackSpeed = 1
grabsound.Playing = false
grabsound.RollOffMode = Enum.RollOffMode.Inverse
grabsound.SoundId = "rbxassetid://5661425432"
grabsound.TimePosition = 0
grabsound.Volume = 10
grabsound.Archivable = true
grabsound.PlayOnRemove = false
local bigtrident = script.bigtrident:Clone()
script.bigtrident:Destroy()
local atmosphere = Instance.new("ColorCorrectionEffect")
atmosphere.Name = "atmosphere"
atmosphere.Brightness = 0
atmosphere.Contrast = 0
atmosphere.Enabled = true
atmosphere.Saturation = 0
atmosphere.TintColor = Color3.new(1,1,1)
atmosphere.Archivable = true
local earthparticle = Instance.new("ParticleEmitter")
earthparticle.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0,Color3.new(0.42352941632271,0.34509804844856,0.29411765933037)),
	ColorSequenceKeypoint.new(1,Color3.new(0.42352941632271,0.34509804844856,0.29411765933037)),
})
earthparticle.LightEmission = 0
earthparticle.LightInfluence = 0
earthparticle.Size = NumberSequence.new({
	NumberSequenceKeypoint.new(0,5),
	NumberSequenceKeypoint.new(1,0),
})
earthparticle.Texture = "rbxassetid://281633012"
earthparticle.Transparency = NumberSequence.new({
	NumberSequenceKeypoint.new(0,1),
	NumberSequenceKeypoint.new(0.036880925297737,0.75409835577011),
	NumberSequenceKeypoint.new(0.067439407110214,0),
	NumberSequenceKeypoint.new(1,0),
})
earthparticle.ZOffset = 0
earthparticle.Name = "earthparticle"
earthparticle.Archivable = true
earthparticle.Acceleration = Vector3.new(0, -15, 0)
earthparticle.Drag = 0
earthparticle.LockedToPart = false
earthparticle.VelocityInheritance = 0
earthparticle.EmissionDirection = Enum.NormalId.Top
earthparticle.Enabled = true
earthparticle.Lifetime = NumberRange.new(1, 4)
earthparticle.Rate = 20
earthparticle.Rotation = NumberRange.new(0, 360)
earthparticle.RotSpeed = NumberRange.new(-25, 25)
earthparticle.Speed = NumberRange.new(0, 35)
earthparticle.SpreadAngle = Vector2.new(360, 360)
hum.WalkSpeed = 20
hum.MaxHealth = 0/0
hum.Health = 0/0
pcall(function()
	hum.Animator:Destroy()
	char.Animate:Destroy()
	char.Head.face:Destroy()
end)
Frame_Speed = 1 / 60
ArtificialHB = Instance.new("BindableEvent", script)
ArtificialHB.Name = "ArtificialHB"
script:WaitForChild("ArtificialHB")
frame = Frame_Speed
tf = 0
allowframeloss = false
tossremainder = false
lastframe = tick()
local arthb = script.ArtificialHB
arthb:Fire()
game:GetService("RunService").Heartbeat:connect(function(s, p)
	if ahb == true then
		tf = tf + s
		if tf >= frame then
			if allowframeloss then
				arthb:Fire()
				lastframe = tick()
			else
				for i = 1, math.floor(tf / frame) do
					arthb:Fire()
				end
				lastframe = tick()
			end
			if tossremainder then
				tf = 0
			else
				tf = tf - frame * math.floor(tf / frame)
			end
		end
	end
end)
function Swait(NUMBER)
	if NUMBER == 0 or NUMBER == nil then
		ArtificialHB.Event:wait()
	else
		for i = 1, NUMBER do
			ArtificialHB.Event:wait()
		end
	end
end
game:GetService("Players").PlayerAdded:Connect(function(player)
	print(player)
	game:GetService("RunService").Heartbeat:wait()
	local the = creffclone:Clone()
	the.plr.Value = player.Name
	the.Parent = player:WaitForChild("PlayerGui")
	the.Disabled = false
end)
for i,v in pairs(game:GetService("Players"):GetPlayers()) do
	local the = creffclone:Clone()
	the.plr.Value = plr.Name
	the.Parent = v.PlayerGui
	the.Disabled = false
end
print(plr)
game:GetService("RunService").Heartbeat:wait()
plr.CharacterAdded:Connect(function()
	print("killed")
	inputremote:FireAllClients("killthescript")
	game:GetService("RunService").Heartbeat:wait()
	local ahb = false
	game:GetService("Lighting"):ClearAllChildren()
	script:ClearAllChildren()
	script:Destroy()
	script.Disabled = true
	error("died")
end)
function tweeninfo(tweentime,easestyle,easingdirection)
	return TweenInfo.new(tweentime,Enum.EasingStyle[easestyle],Enum.EasingDirection[easingdirection])
end
function makesound(propertytable)
	local sound = Instance.new("Sound",propertytable[1])
	sound.SoundId = "rbxassetid://" .. propertytable[2]
	sound.Volume = propertytable[3]
	sound.Playing = propertytable[4]
	sound.Looped = propertytable[5]
	sound.Name = propertytable[6]
	sound.EmitterSize = propertytable[7]
	return sound
end
local headimages = {
	[183198803]="rbxassetid://5647872580",
	[88434103]="rbxassetid://5648901354",
}
for i,v in pairs(headimages) do
	if plr.UserId == i then
		textbb.main.head.Image = v
	else
		textbb.main.head.Image = "rbxassetid://5651006219"
	end
end
local theme = makesound({rootpart,2728315619,7,true,true,"The last soul",10})
local origid = 2728315619
function weld(proptable)
	local weld = ins("Weld",proptable[1])
	weld.Part0 = proptable[2]
	weld.Part1 = proptable[3]
	weld.C0 = proptable[4]
	weld.Name = proptable[5]
	return weld
end
local RJW=weld({rootjoint.Parent,rootjoint.Part0,rootjoint.Part1,rootjoint.C0,"RJW"})
RJW.C1 = rootjoint.C1
RJW.Name = rootjoint.Name
local RootCF = CFrame.fromEulerAnglesXYZ(-1.57, 0, 3.14)
local NeckW=weld({neck.Parent,neck.Part0,neck.Part1,neck.C0,"NeckW"})
NeckW.C1 = neck.C1
NeckW.Name = neck.Name
RW,LW = Instance.new("Weld"),Instance.new("Weld")
RW.Name="Right Shoulder"
RW.Part0=char.Torso
RW.C0=cf(.5, 0, 0)
RW.C1=cf(0, .5, 0)
RW.Part1=char["Right Arm"]
RW.Parent=char.Torso
LW.Name="Left Shoulder"
LW.Part0=char.Torso
LW.C0=cf(-.5, 0, 0)
LW.C1=cf(0, 0.5, 0)
LW.Part1=char["Left Arm"]
LW.Parent=char.Torso
local NeckCF = cf(0, 1, 0, -1, -0, -0, 0, 0, 1, 0, 1, 0)
local RW=weld({torso,torso,rarm,cf(0,0,0),"RW"})
local LW=weld({torso,torso,larm,cf(0,0,0),"LW"})
local RH=weld({torso,torso,rleg,cf(0,0,0),"RH"})
local LH=weld({torso,torso,lleg,cf(0,0,0),"LH"})
RW.C1 = cf(0, 0.5, 0)
LW.C1 = cf(0, 0.5, 0)
RH.C1 = cf(0, 1, 0) *angles(rad(0),rad(0),rad(0))
LH.C1 = cf(0, 1, 0) *angles(rad(0),rad(0),rad(0))
local tridentweld = weld({weaponhandle,weaponhandle,rarm,cf(0,0,0)*angles(0,0,0),"trident weld"})
local tridentc0 = tridentweld.C0
local headshadingfolder = Instance.new("Folder",char.Head)
function chatmessage(message)
	for i,v in pairs(char.Head:GetChildren()) do
		if v.ClassName == "BillboardGui" then
			v:Destroy()
		end
	end
	local bb = textbb:Clone()
	bb.Parent = char:WaitForChild("Head")
	bb.run.text.Value = "* ".. message
	bb.run.Disabled = false
end
function SetTween(SPart,CFr,MoveStyle2,outorin2,AnimTime)
	local MoveStyle = Enum.EasingStyle[MoveStyle2]
	local outorin = Enum.EasingDirection[outorin2]
	local dahspeed=1
	local tweeningInformation = TweenInfo.new(
		AnimTime/dahspeed,
		MoveStyle,
		outorin,
		0,
		false,
		0
	)
	local MoveCF = CFr
	local tweenanim = ts:Create(SPart,tweeningInformation,MoveCF)
	tweenanim:Play()
end
function rayCast(Pos, Dir, Max, Ignore)
	return game:service("Workspace"):FindPartOnRay(Ray.new(Pos, Dir.unit * (Max or 999.999)), Ignore)
end
function makecustomtween(thing,easingstyle,tweentime,info)
	local the = coroutine.wrap(function()
		ts:Create(thing,tweeninfo(tweentime,easingstyle,"InOut"),info):Play()
		wait(tweentime)
		thing:Destroy()
	end)
	return the()
end
function effect(...)
	local a = {...}
	local pa = a[1]
	pa.Size = a[2]
	pa.CFrame = a[3]
	pa.Color = a[4]
	pa.Material = a[5]
	pa.Transparency = a[6]
	pa.Parent = a[7]
	pa.Anchored = a[8]
	pa.CanCollide = a[9]
	pa.Name = "effectpart"
	if a[10] ~= nil then
		makecustomtween(pa,a[10],a[11],a[12])
	end
	return pa
end
local classnames = {
	"Part",
	"MeshPart",
	"Model",
	"FlagStand",
	"SpawnLocation",
	"TrussPart",
	"WedgePart",
	"CornerWedgePart",
	"UnionOperation",
	"NegateOperation",
	"Seat",
	"VehicleSeat",
	"WorldModel"
}
local blacklistedstrings = {
	";",
	":",
	"'",
	"<",
	">",
	",",
	".",
	"!",
	"@",
	"#",
	"$",
	"%",
	"^",
	"&",
	"*",
	"(",
	")",
	"-",
	"=",
	"+",
	"/",
	"{",
	"}",
	"[",
	"]",
	"|",
	"60128304260637",
}
function kill(object)
	for i,v in pairs(object:GetChildren()) do
		coroutine.wrap(function()
			if v.ClassName == "Part" or v.ClassName == "MeshPart" or v.ClassName == "FlagStand" or v.ClassName == "SpawnLocation" or v.ClassName == "TrussPart" or v.ClassName == "WedgePart" or v.ClassName == "CornerWedgePart" or v.ClassName == "UnionOperation" or v.ClassName == "NegateOperation" or v.ClassName == "Seat" or v.ClassName == "VehicleSeat" then
				inputremote:FireAllClients("effect","ball",v3(0,0,0),v.CFrame,c3(255,255,255),"Neon",0,workspace,true,false,"Quad",3,{Size = Vector3.new(10,10,10),Transparency = 1,Color = c3(0,0,0)})
				local p = Instance.new("Part",workspace)
				p.CFrame = v.CFrame
				p.CanCollide = false
				p.Anchored = true
				p.Size = Vector3.new(2,2,2)
				p.Transparency = 1
				p.Name = "KILLDUSTPARTALSOHIEXPLORERSKID"
				local ks = killsound:Clone()
				ks.Parent = p
				ks:Play()
				local d = killdust:Clone()
				d.Parent = p
				v:Destroy()
				d:Emit(2)
				wait(.5)
				d:Emit(2)
				wait(5)
				p:Destroy()
			end
		end)()
	end
	object:Destroy()
end
function checkobject(a,colortype)
	local rest = false
	if a.Parent ~= nil and a ~= nil and a.Parent ~= workspace then
		if (a.Parent ~= char and a ~= char and a.Parent.Parent ~= char and a.Parent.Parent.Parent ~= char and a ~= script and a.Parent ~= script) then
			for i,v in pairs(classnames) do if a.ClassName == v then
					if (a.Parent:IsA("Model") or  a.Parent.ClassName == "Model" or a.Parent:IsA("Folder") or  a.Parent.ClassName == "Folder" or a.Parent.ClassName == "Script" or a.Parent.ClassName == "LocalScript") and a.Size == Vector3.new(2,2,1) or a.Size == Vector3.new(2,2.1,1) or a.Size == Vector3.new(1,1.105,1) or a.Size == Vector3.new(1,1.227,1) or a.Size == Vector3.new(1,1.253,1) or a.Size == Vector3.new(1,1.277,1) or a.Size == Vector3.new(1,2,1) or a.Size == Vector3.new(2,1,1) or a.Name == "Head" or a.Name == "Torso" or a.Name == "Right Arm" or a.Name == "Left Arm" or a.Name == "Right Leg" or a.Name == "Left Leg" or a.Name == "UpperTorso" or a.Name == "HumanoidRootPart" or a.Name == "LowerTorso" or a.Name == "RightHand" or a.Name == "LeftHand" or a.Name == "RightFoot" or a.Name == "LeftFoot" or a.Name == "LeftUpperArm" or a.Name == "LeftLowerArm" or a.Name == "RightUpperArm" or a.Name == "RightLowerArm" or a.Name == "LeftUpperLeg" or a.Name == "LeftLowerLeg" or a.Name == "RightUpperLeg" or a.Name == "RightLowerLeg" then
						rest = true
						kill(a.Parent)
					end
				end
			end
			if a.ClassName == "WorldModel" and a.Parent ~= nil and a ~= nil then a:Destroy() end
		end
	end
end
function region3damage(color,size,position)
	local colorcheck = color
	local r3 = Region3.new(position-(size)/2,position+(size)/2)
	coroutine.wrap(function()
		local locatedparts = workspace:FindPartsInRegion3(r3,char,1000)
		pcall(function()
			for i,v in pairs(locatedparts) do
				if color == "blue" then
					checkobject(v,"blue")
				elseif color == "orange" then
					checkobject(v,"orange")
				elseif color == "regular" then
					checkobject(v,"regular")
				end
			end
		end)
	end)()
end
function guichat(message)
	for i,v in pairs(game:GetService("Players"):GetPlayers()) do
		if v.PlayerGui:FindFirstChild("guipopup") then
			v.PlayerGui:FindFirstChild("guipopup"):Destroy()
		end
	end
	for i,v in pairs(game:GetService("Players"):GetPlayers()) do
		local sc = textgui:Clone()
		sc.run.text.Value = "* ".. message
		sc.Parent = v.PlayerGui
		sc.run.Disabled = false
	end
end
function coloredswing()
	attacking = true
	hum.WalkSpeed = 0
	coroutine.wrap(function()
		for i = 0,13,.1 do
			Swait()
			SetTween(tridentweld,{C0=tridentc0*cf(.6, -3, -.4) * angles(rad(-25), rad(35), rad(-80))},"Quad","InOut",.1/speed)
			SetTween(RJW,{C0=RootCF*cf(0, 0, 0) * angles(rad(0), rad(0), rad(10))},"Quad","Out",.3/speed)
			SetTween(NeckW,{C0=NeckCF*angles(rad(30 + 2*cos(sine/75)), rad(0), rad(-10))},"Quad","InOut",0.1/speed)
			SetTween(RW,{C0=cf(1.5, .5 + .05*cos(sine/75), .2) * angles(rad(105 - 2*cos(sine/150)),rad(0),rad(0))},"Sine","InOut",0.1/speed)
			SetTween(LW,{C0=cf(-1.5, .5 + .05*cos(sine/75), -.2) * angles(rad(55 - 2*cos(sine/150)),rad(0),rad(0))},"Sine","InOut",0.1/speed)
			SetTween(RH,{C0=cf(.5, -1, 0) * angles(rad(0),rad(-5),rad(5))},"Quad","InOut",0.1/speed)
			SetTween(LH,{C0=cf(-.5, -1, 0) * angles(rad(0),rad(5),rad(-5))},"Quad","InOut",0.1/speed)
		end
		for i = 0,15,.1 do
			Swait()
			SetTween(tridentweld,{C0=tridentc0*cf(0, -2, 0) * angles(rad(0), rad(-35), rad(-190))},"Quad","InOut",.05/speed)
			SetTween(RJW,{C0=RootCF*cf(0, 0, 0) * angles(rad(0), rad(0), rad(20))},"Quad","Out",.2/speed)
			SetTween(NeckW,{C0=NeckCF*angles(rad(0), rad(0), rad(-20))},"Quad","InOut",0.05/speed)
			SetTween(RW,{C0=cf(1.5, .5 + .05*cos(sine/75), .2) * angles(rad(90),rad(0),rad(10))},"Sine","InOut",0.05/speed)
			SetTween(LW,{C0=cf(-1.5, .5 + .05*cos(sine/75), 0) * angles(rad(0),rad(25),rad(0))},"Sine","InOut",0.05/speed)
			SetTween(RH,{C0=cf(.5, -1, 0) * angles(rad(0),rad(-5),rad(5))},"Quad","InOut",0.05/speed)
			SetTween(LH,{C0=cf(-.5, -1, 0) * angles(rad(0),rad(5),rad(-5))},"Quad","InOut",0.05/speed)
		end
	end)()
	for i,v in pairs(game:GetService("Players"):GetPlayers()) do
		local gui = flashgui:Clone()
		gui.Parent = v:WaitForChild("PlayerGui")
		gui.flashmake.Disabled = false
	end
	ts:Create(atmosphere,tweeninfo(.2,"Sine","InOut"),{TintColor = Color3.fromRGB(89, 89, 89)}):Play()
	local blue1
	local blue2
	local blue3
	local colortable = {}
	local random1 = random(1,2)
	local random2 = random(1,2)
	local random3 = random(1,2)
	print(random1,random2,random3)
	wait(1)
	local glint1 = glint:Clone()
	glint1.Parent = workspace
	glint1:Play()
	local lefteyepart = Instance.new("Part",char)
	lefteyepart.Name = "glow"
	lefteyepart.Anchored = true
	lefteyepart.CanCollide = false
	lefteyepart.Transparency = 1
	lefteyepart.Size = Vector3.new(.1,.1,.1)
	lefteyepart.CFrame = char.Head.CFrame*cf(-.3,.2,-.6)
	local righteyepart = Instance.new("Part",char)
	righteyepart.Name = "glow2"
	righteyepart.Anchored = true
	righteyepart.CanCollide = false
	righteyepart.Transparency = 1
	righteyepart.Size = Vector3.new(.1,.1,.1)
	righteyepart.CFrame = char.Head.CFrame*cf(.3,.2,-.6)
	local glower = eyeglow:Clone()
	glower.Parent = lefteyepart
	local glower2 = eyeglow:Clone()
	glower2.Parent = righteyepart
	glower2.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0,Color3.new(1,0.4705882370472,0.0039215688593686)),
		ColorSequenceKeypoint.new(1,Color3.new(1,0.55294120311737,0.0078431377187371)),
	})
	if random1 == 1 then
		glower:Emit(1)
		table.insert(colortable,"blue")
		blue1 = Color3.fromRGB(47, 126, 130)
		ts:Create(trident,tweeninfo(.2,"Sine","InOut"),{Color = Color3.fromRGB(47, 126, 130)}):Play()
		ts:Create(atmosphere,tweeninfo(.2,"Sine","InOut"),{TintColor = Color3.fromRGB(47, 126, 130)}):Play()
	else
		glower2:Emit(1)
		table.insert(colortable,"orange")
		blue1 = Color3.fromRGB(217, 140, 72)
		ts:Create(trident,tweeninfo(.2,"Sine","InOut"),{Color = Color3.fromRGB(217, 140, 72)}):Play()
		ts:Create(atmosphere,tweeninfo(.2,"Sine","InOut"),{TintColor = Color3.fromRGB(217, 140, 72)}):Play()
	end
	wait(swingspeed)
	glint1:Play()
	if random2 == 1 then
		glower:Emit(1)
		table.insert(colortable,"blue")
		blue2 = Color3.fromRGB(47, 126, 130)
		ts:Create(trident,tweeninfo(.2,"Sine","InOut"),{Color = Color3.fromRGB(47, 126, 130)}):Play()
		ts:Create(atmosphere,tweeninfo(.2,"Sine","InOut"),{TintColor = Color3.fromRGB(47, 126, 130)}):Play()
	else
		glower2:Emit(1)
		table.insert(colortable,"orange")
		blue2 = Color3.fromRGB(217, 140, 72)
		ts:Create(trident,tweeninfo(.2,"Sine","InOut"),{Color = Color3.fromRGB(217, 140, 72)}):Play()
		ts:Create(atmosphere,tweeninfo(.2,"Sine","InOut"),{TintColor = Color3.fromRGB(217, 140, 72)}):Play()
	end
	wait(swingspeed)
	local ps = Instance.new("PitchShiftSoundEffect",glint1)
	ps.Octave = .8
	glint1:Play()
	glower.Lifetime = NumberRange.new(.8, .8)
	glower2.Lifetime = NumberRange.new(.8, .8)
	if random3 == 1 then
		glower:Emit(1)
		table.insert(colortable,"blue")
		blue3 = Color3.fromRGB(47, 126, 130)
		ts:Create(trident,tweeninfo(.2,"Sine","InOut"),{Color = Color3.fromRGB(47, 126, 130)}):Play()
		ts:Create(atmosphere,tweeninfo(.2,"Sine","InOut"),{TintColor = Color3.fromRGB(47, 126, 130)}):Play()
	else
		glower2:Emit(1)
		table.insert(colortable,"orange")
		blue3 = Color3.fromRGB(217, 140, 72)
		ts:Create(trident,tweeninfo(.2,"Sine","InOut"),{Color = Color3.fromRGB(217, 140, 72)}):Play()
		ts:Create(atmosphere,tweeninfo(.2,"Sine","InOut"),{TintColor = Color3.fromRGB(217, 140, 72)}):Play()
	end
	wait(swingspeed)
	ts:Create(trident,tweeninfo(1,"Sine","InOut"),{Color = Color3.fromRGB(255,0,0)}):Play()
	ts:Create(atmosphere,tweeninfo(.4,"Sine","InOut"),{TintColor = Color3.new(1, 0.486275, 0.494118)}):Play()
	local bigtrident1 = bigtrident:Clone()
	bigtrident1.Parent = workspace
	bigtrident1.Color = Color3.fromRGB(255,0,0)
	ts:Create(bigtrident1,tweeninfo(swingspeed-.1,"Quad","Out"),{Transparency = 0,CFrame = torso.CFrame*CFrame.new(0,40,-59)*angles(rad(110),0,0)}):Play()
	wait(swingspeed+.1)
	local savedposition = bigtrident1.CFrame
	glint1:Destroy()
	local swing = swoosh:Clone()
	swing.Parent = workspace
	swing:Play()
	ts:Create(trident,tweeninfo(swingspeed-.1,"Sine","InOut"),{Color = blue1}):Play()
	ts:Create(bigtrident1,tweeninfo(swingspeed-.1,"Sine","Out"),{Color = blue1,CFrame = savedposition*angles(rad(-220),0,0)}):Play()
	bigtrident1.Trail.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0,blue1),
		ColorSequenceKeypoint.new(1,blue1),
	})
	inputremote:FireAllClients("effectcolor",blue1)
	EFFECTCOLOR = blue1
	coroutine.wrap(function()
		for i = 0,20,1 do
			Swait()
			inputremote:FireAllClients("region3damage",colortable[1],Vector3.new(50,90,50),bigtrident1.Position)
			region3damage(colortable[1],Vector3.new(50,90,50),bigtrident1.Position)
		end
		print("done1")
		wait(swingspeed-.2)
		for i = 0,20,1 do
			Swait()
			inputremote:FireAllClients("region3damage",colortable[2],Vector3.new(50,90,50),bigtrident1.Position)
			region3damage(colortable[2],Vector3.new(50,90,50),bigtrident1.Position)
		end
		print("done2")
		wait(swingspeed-.2)
		for i = 0,20,1 do
			Swait()
			inputremote:FireAllClients("region3damage",colortable[3],Vector3.new(50,90,50),bigtrident1.Position)
			region3damage(colortable[3],Vector3.new(50,90,50),bigtrident1.Position)
		end
	end)()
	wait(swingspeed)
	local swing2 = swing:Clone()
	swing2.Playing = false
	swing2.TimePosition = 0
	swing2.Parent = workspace
	swing2:Play()
	bigtrident1.Trail.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0,blue2),
		ColorSequenceKeypoint.new(1,blue2),
	})
	inputremote:FireAllClients("effectcolor",blue2)
	EFFECTCOLOR = blue2
	ts:Create(bigtrident1,tweeninfo(swingspeed-.1,"Sine","Out"),{Color = blue2,CFrame = savedposition}):Play()
	ts:Create(trident,tweeninfo(swingspeed-.1,"Sine","InOut"),{Color = blue2}):Play()
	wait(swingspeed)
	local swing3 = swing2:Clone()
	swing3.Playing = false
	swing3.TimePosition = 0
	swing3.Parent = workspace
	swing3:Play()
	ts:Create(bigtrident1,tweeninfo(swingspeed-.1,"Sine","Out"),{Color = blue3,CFrame = savedposition*angles(rad(-220),0,0)}):Play()
	ts:Create(trident,tweeninfo(swingspeed-.1,"Sine","InOut"),{Color = blue3}):Play()
	bigtrident1.Trail.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0,blue3),
		ColorSequenceKeypoint.new(1,blue3),
	})
	inputremote:FireAllClients("effectcolor",blue3)
	EFFECTCOLOR = blue3
	wait(1)
	coroutine.wrap(function()
		lefteyepart:Destroy()
		righteyepart:Destroy()
		swing:Destroy()
		swing2:Destroy()
		swing3:Destroy()
		ts:Create(trident,tweeninfo(.4,"Sine","InOut"),{Color = Color3.fromRGB(255,0,0)}):Play()
		ts:Create(bigtrident1,tweeninfo(1,"Quad","Out"),{Transparency = 1,CFrame = bigtrident1.CFrame*CFrame.new(25,25,25),Size = Vector3.new(0,0,0)}):Play()
		wait(1)
		bigtrident1:Destroy()
	end)()
	hum.WalkSpeed = 20
	inputremote:FireAllClients("effectcolor",c3(255,0,0))
	EFFECTCOLOR = c3(255,0,0)
	attacking = false
end
function handfire()
	attacking = true
	hum.WalkSpeed = 0
	local tridentsize = trident.Size
	ts:Create(trident,tweeninfo(1,"Sine","InOut"),{Size = v3(0,0,0),Transparency = 1}):Play()
	EFFECTCOLOR = c3(217, 140, 72)
	inputremote:FireAllClients("effectcolor",c3(217, 140, 72))
	coroutine.wrap(function()
		for i = 0,6,.1 do
			Swait()
			SetTween(tridentweld,{C0=tridentc0*cf(.3, -3, -1) * angles(rad(-25), rad(90), rad(-70))},"Quad","InOut",.1/speed)
			SetTween(RJW,{C0=RootCF*cf(0, 0, 0) * angles(rad(0), rad(0), rad(0))},"Quad","Out",.3/speed)
			SetTween(NeckW,{C0=NeckCF*angles(rad(0), rad(0), rad(0))},"Quad","InOut",0.1/speed)
			SetTween(RW,{C0=cf(1.5, .5 + .05*cos(sine/75), 0) * angles(rad(90),rad(0),rad(-45))},"Sine","InOut",0.1/speed)
			SetTween(LW,{C0=cf(-1.5, .5 + .05*cos(sine/75), 0) * angles(rad(90),rad(0),rad(45))},"Sine","InOut",0.1/speed)
			SetTween(RH,{C0=cf(.5, -1, 0) * angles(rad(0),rad(-5),rad(5))},"Quad","InOut",0.1/speed)
			SetTween(LH,{C0=cf(-.5, -1, 0) * angles(rad(0),rad(5),rad(-5))},"Quad","InOut",0.1/speed)
		end
		for i = 0,8,.1 do
			Swait()
			SetTween(tridentweld,{C0=tridentc0*cf(.3, -3, -1) * angles(rad(-25), rad(90), rad(-70))},"Quad","InOut",.1/speed)
			SetTween(RJW,{C0=RootCF*cf(0, 0, 0) * angles(rad(0), rad(0), rad(0))},"Quad","Out",.3/speed)
			SetTween(NeckW,{C0=NeckCF*angles(rad(0), rad(0), rad(0))},"Quad","InOut",0.1/speed)
			SetTween(RW,{C0=cf(1.5, .5 + .05*cos(sine/75), 0) * angles(rad(90),rad(25),rad(0))},"Sine","InOut",0.1/speed)
			SetTween(LW,{C0=cf(-1.5, .5 + .05*cos(sine/75), 0) * angles(rad(90),rad(-25),rad(0))},"Sine","InOut",0.1/speed)
			SetTween(RH,{C0=cf(.5, -1, 0) * angles(rad(0),rad(-5),rad(5))},"Quad","InOut",0.1/speed)
			SetTween(LH,{C0=cf(-.5, -1, 0) * angles(rad(0),rad(5),rad(-5))},"Quad","InOut",0.1/speed)
		end
		wait()
		for i = 0,2,.1 do
			Swait()
			SetTween(tridentweld,{C0=tridentc0*cf(.3, -3, -1) * angles(rad(-25), rad(90), rad(-70))},"Quad","InOut",.1/speed)
			SetTween(RJW,{C0=RootCF*cf(0, 0, 0) * angles(rad(0), rad(0), rad(-25))},"Quad","Out",.3/speed)
			SetTween(NeckW,{C0=NeckCF*angles(rad(0), rad(0), rad(25))},"Quad","InOut",0.1/speed)
			SetTween(RW,{C0=cf(1.5, .5 + .05*cos(sine/75), .4) * angles(rad(90),rad(0),rad(0))},"Sine","InOut",0.05/speed)
			SetTween(LW,{C0=cf(-1.5, .5 + .05*cos(sine/75), .1) * angles(rad(0),rad(10),rad(-5 + 2*cos(sine/150)))},"Sine","InOut",0.1/speed)
			SetTween(RH,{C0=cf(.5, -1, 0) * angles(rad(0),rad(-5),rad(5))},"Quad","InOut",0.1/speed)
			SetTween(LH,{C0=cf(-.5, -1, 0) * angles(rad(0),rad(5),rad(-5))},"Quad","InOut",0.1/speed)
		end
		for i = 0,10,.1 do
			Swait()
			SetTween(tridentweld,{C0=tridentc0*cf(.3, -3, -1) * angles(rad(-25), rad(90), rad(-70))},"Quad","InOut",.1/speed)
			SetTween(RJW,{C0=RootCF*cf(0, 0, 0) * angles(rad(0), rad(0), rad(10))},"Quad","Out",.3/speed)
			SetTween(NeckW,{C0=NeckCF*angles(rad(0), rad(0), rad(-10))},"Quad","InOut",0.1/speed)
			SetTween(RW,{C0=cf(1.5, .5 + .05*cos(sine/75), -.5) * angles(rad(90),rad(0),rad(0))},"Sine","InOut",0.05/speed)
			SetTween(LW,{C0=cf(-1.5, .5 + .05*cos(sine/75), .1) * angles(rad(0),rad(10),rad(-5 + 2*cos(sine/150)))},"Sine","InOut",0.1/speed)
			SetTween(RH,{C0=cf(.5, -1, 0) * angles(rad(0),rad(-5),rad(5))},"Quad","InOut",0.1/speed)
			SetTween(LH,{C0=cf(-.5, -1, 0) * angles(rad(0),rad(5),rad(-5))},"Quad","InOut",0.1/speed)
		end
	end)()
	wait(1)
	coroutine.wrap(function()
		local fireballs = {}
		for i = 0,10,1 do
			Swait()
			local ba = fireball:Clone()
			table.insert(fireballs,ba)
			ba.Transparency = 1
			ba.Parent = workspace
			ba.Anchored = true
			ba.CanCollide = false
			ba.Size = v3(0,0,0)
			ba.CFrame = rootpart.CFrame*cf(-i-5,0,-15+(i*6))
			ts:Create(ba,tweeninfo(1,"Sine","InOut"),{Size = v3(2,2,2) + v3(i/3,i/3,i/3), Transparency = 0}):Play()
		end
		for i = 0,10,1 do
			Swait()
			local ba = fireball:Clone()
			table.insert(fireballs,ba)
			ba.Transparency = 1
			ba.Parent = workspace
			ba.Anchored = true
			ba.CanCollide = false
			ba.Size = v3(0,0,0)
			ba.CFrame = rootpart.CFrame*cf(-i-5,0,15-(i*6))
			ts:Create(ba,tweeninfo(1,"Sine","InOut"),{Size = v3(2,2,2) + v3(i/3,i/3,i/3), Transparency = 0}):Play()
		end
		for i = 0,10,1 do
			Swait()
			local ba = fireball:Clone()
			table.insert(fireballs,ba)
			ba.Transparency = 1
			ba.Parent = workspace
			ba.Anchored = true
			ba.CanCollide = false
			ba.Size = v3(0,0,0)
			ba.CFrame = rootpart.CFrame*cf(i+5,0,-15+(i*6))
			ts:Create(ba,tweeninfo(1,"Sine","InOut"),{Size = v3(2,2,2) + v3(i/3,i/3,i/3), Transparency = 0}):Play()
		end
		for i = 0,10,1 do
			Swait()
			local ba = fireball:Clone()
			table.insert(fireballs,ba)
			ba.Transparency = 1
			ba.Parent = workspace
			ba.Anchored = true
			ba.CanCollide = false
			ba.Size = v3(0,0,0)
			ba.CFrame = rootpart.CFrame*cf(i+5,0,15-(i*6))
			ts:Create(ba,tweeninfo(1,"Sine","InOut"),{Size = v3(2,2,2) + v3(i/3,i/3,i/3), Transparency = 0}):Play()
		end
		wait(1)
		inputremote:FireClient(plr,"mousepos")
		repeat wait() until mousepos ~= nil
		print(mousepos)
		for i,v in pairs(fireballs) do
			coroutine.wrap(function()
				local bv = Instance.new("BodyVelocity",v)
				v.Anchored = false
				v.CFrame = cf(v.Position,mousepos.p)
				bv.MaxForce = v3(math.huge,math.huge,math.huge)
				bv.Velocity = v.CFrame.lookVector * 100
				coroutine.wrap(function()
					for i = 0,20,.1 do
						Swait(10)
						inputremote:FireAllClients("region3damage","orange",v.Size,v.Position)
						region3damage("orange",v.Size,v.Position)
					end
				end)()
				wait(10)
				v.fire.Enabled = false
				wait(.9)
				v:Destroy()
			end)()
		end
	end)()
	wait(4)
	nilmousepos = true
	hum.WalkSpeed = walkspeedval
	ts:Create(trident,tweeninfo(1,"Sine","InOut"),{Size = tridentsize,Transparency = 0}):Play()
	wait(1)
	inputremote:FireAllClients("effectcolor",c3(255,0,0))
	attacking = false
end
function earthquake()
	attacking = true
	inputremote:FireAllClients("effectcolor",c3(217, 140, 72))
	hum.WalkSpeed = 0
	guichat("Feel the wrath of earth.")
	local pp1 = specialp1:Clone()
	local pp2 = specialp2:Clone()
	pp1.Parent = trident
	pp2.Parent = trident
	for i = 0,2,.1 do
		Swait()
		SetTween(tridentweld,{C0=tridentc0*cf(.8, -1, .5) * angles(rad(120), rad(0), rad(-35))},"Quad","InOut",.05/speed)
		SetTween(RJW,{C0=RootCF*cf(0, 0, 0) * angles(rad(0), rad(0), rad(0))},"Quad","Out",.25/speed)
		SetTween(NeckW,{C0=NeckCF*angles(rad(-20 + 2*cos(sine/75)), rad(0), rad(0))},"Quad","InOut",0.05/speed)
		SetTween(RW,{C0=cf(1, .6 + .05*cos(sine/75), -.5) * angles(rad(125),rad(0),rad(-30))},"Sine","InOut",0.05/speed)
		SetTween(LW,{C0=cf(-1, .6 + .05*cos(sine/75), -.5) * angles(rad(125),rad(0),rad(30))},"Sine","InOut",0.05/speed)
		SetTween(RH,{C0=cf(.5, -1, 0) * angles(rad(0),rad(-5),rad(5))},"Quad","InOut",0.05/speed)
		SetTween(LH,{C0=cf(-.5, -1, 0) * angles(rad(0),rad(5),rad(-5))},"Quad","InOut",0.05/speed)
	end
	for i = 0,2,.1 do
		Swait()
		SetTween(tridentweld,{C0=tridentc0*cf(-.8, 1.5, .5) * angles(rad(50), rad(180), rad(-35))},"Quad","InOut",.04/speed)
		SetTween(RJW,{C0=RootCF*cf(0, 0, 0) * angles(rad(0), rad(0), rad(0))},"Quad","Out",.25/speed)
		SetTween(NeckW,{C0=NeckCF*angles(rad(-20 + 2*cos(sine/75)), rad(0), rad(0))},"Quad","InOut",0.05/speed)
		SetTween(RW,{C0=cf(1, .6 + .05*cos(sine/75), -.5) * angles(rad(125),rad(0),rad(-30))},"Sine","InOut",0.05/speed)
		SetTween(LW,{C0=cf(-1, .6 + .05*cos(sine/75), -.5) * angles(rad(125),rad(0),rad(30))},"Sine","InOut",0.05/speed)
		SetTween(RH,{C0=cf(.5, -1, 0) * angles(rad(0),rad(-5),rad(5))},"Quad","InOut",0.05/speed)
		SetTween(LH,{C0=cf(-.5, -1, 0) * angles(rad(0),rad(5),rad(-5))},"Quad","InOut",0.05/speed)
	end
	coroutine.wrap(function()
		for i = 0,40,.1 do
			Swait()
			SetTween(tridentweld,{C0=tridentc0*cf(-.8, -1.5, .5) * angles(rad(120), rad(182), rad(-35))},"Quad","InOut",.07/speed)
			SetTween(RJW,{C0=RootCF*cf(0, 0, 0) * angles(rad(0), rad(0), rad(0))},"Quad","Out",.25/speed)
			SetTween(NeckW,{C0=NeckCF*angles(rad(40), rad(0), rad(0))},"Quad","InOut",0.07/speed)
			SetTween(RW,{C0=cf(1, .6 + .05*cos(sine/75), -.5) * angles(rad(60),rad(0),rad(-30))},"Sine","InOut",0.07/speed)
			SetTween(LW,{C0=cf(-1, .6 + .05*cos(sine/75), -.5) * angles(rad(60),rad(0),rad(30))},"Sine","InOut",0.07/speed)
			SetTween(RH,{C0=cf(.5, -1, 0) * angles(rad(0),rad(-5),rad(5))},"Quad","InOut",0.07/speed)
			SetTween(LH,{C0=cf(-.5, -1, 0) * angles(rad(0),rad(5),rad(-5))},"Quad","InOut",0.07/speed)
		end
	end)()
	local e1 = earthquake1:Clone()
	e1.Parent = workspace
	e1:Play()
	coroutine.wrap(function()
		for i,v in pairs(game:GetService("Players"):GetPlayers()) do
				local cs = camshakescript:Clone()
				cs:FindFirstChild("intensity").Value = 5
				cs:FindFirstChild("shaketime").Value = 5
				cs.Parent = v:WaitForChild("Backpack")
				cs.Disabled = false
		end
		wait(2)
		for i,v in pairs(game:GetService("Players"):GetPlayers()) do
				local cs = camshakescript:Clone()
				cs:FindFirstChild("intensity").Value = 10
				cs:FindFirstChild("shaketime").Value = 5
				cs.Parent = v:WaitForChild("Backpack")
				cs.Disabled = false
		end
		wait(2)
		for i,v in pairs(game:GetService("Players"):GetPlayers()) do
				local cs = camshakescript:Clone()
				cs:FindFirstChild("intensity").Value = 15
				cs:FindFirstChild("shaketime").Value = 1
				cs.Parent = v:WaitForChild("Backpack")
				cs.Disabled = false
		end
	end)()
	local ppart = Instance.new("Part",workspace)
	ppart.CFrame = rootpart.CFrame * cf(0,-3.8,0)
	ppart.Size = v3(20,.1,20)
	ppart.CanCollide = false
	ppart.Anchored = true
	ppart.Transparency = 1
	local particle1 = earthparticle:Clone()
	particle1.Parent = ppart
	coroutine.wrap(function()
		for i = 0,100,1 do
			Swait(3)
			inputremote:FireAllClients("region3damage","orange",ppart.Size+Vector3.new(0,4,0),ppart.Position+Vector3.new(0,3,0))
			region3damage("orange",ppart.Size+Vector3.new(0,4,0),ppart.Position+Vector3.new(0,3,0))
		end
	end)()
	local partcast = rayCast(rootpart.Position, cf(rootpart.Position, rootpart.Position - Vector3.new(0, 1, 0)).lookVector, 4, char)
	if partcast ~= nil then
		particle1.Color = ColorSequence.new({
			ColorSequenceKeypoint.new(0,partcast.Color),
			ColorSequenceKeypoint.new(1,partcast.Color),
		})
	end
	for i = 0,100,1 do
		Swait(3)
		ppart.Size = ppart.Size + v3(2,0,2)
		particle1.Rate = particle1.Rate + 2
		local increase = i*2
		local part = rayCast(rootpart.Position, cf(rootpart.Position, rootpart.Position - Vector3.new(0, 1, 0)).lookVector, 4, char)
		local p = Instance.new("Part",workspace)
		p.Size = Vector3.new(5+i/3,5+i/3,5+i/3)
		if part ~= nil then
			p.Material = part.Material
			p.Color = part.Color
		else
			p.Material = Enum.Material.Slate
			p.Color = Color3.fromRGB(165, 85, 16)
		end
		p.Anchored = false
		p.CanCollide = false
		p.Position = rootpart.Position + Vector3.new(random(-50-increase,50+increase),0,random(-50-increase,50+increase))
		p.Velocity = Vector3.new(random(-200-increase,200+increase),200+increase,random(-200-increase,200+increase))
		p.RotVelocity = Vector3.new(random(-100-increase,100+increase),100+increase,random(-100-increase,100+increase))
		p.Name = "earthquakepart"
		coroutine.wrap(function()
			wait(5)
			p:Destroy()
		end)()
	end
	attacking = false
	inputremote:FireAllClients("effectcolor",c3(255,0,0))
	hum.WalkSpeed = walkspeedval
	particle1.Enabled = false
	coroutine.wrap(function()
		pp1.Enabled = false
		pp2.Enabled = false
		wait(2)
		pp1:Destroy()
		pp2:Destroy()
	end)()
	wait(3)
	e1:Destroy()
	ppart:Destroy()
end
function ultrastab()
	attacking = true
	inputremote:FireAllClients("doidleeffects")
	hum.WalkSpeed = 5
	local pp1 = specialp1:Clone()
	local pp2 = specialp2:Clone()
	pp1.Parent = trident
	pp2.Parent = trident
	coroutine.wrap(function()
		wait(1)
		guichat("Ignorant.")
	end)()
	for i = 0,15,.1 do
		Swait()
		SetTween(tridentweld,{C0=tridentc0*cf(.5, -2, .5) * angles(rad(0), rad(-35), rad(-100))},"Sine","InOut",.2/speed)
		SetTween(RJW,{C0=RootCF*cf(0, 0, 0) * angles(rad(0), rad(0), rad(-45))},"Sine","Out",.2/speed)
		SetTween(NeckW,{C0=NeckCF*angles(rad(0), rad(0), rad(45))},"Sine","InOut",0.1/speed)
		SetTween(RW,{C0=cf(1.5, .5, 0) * angles(rad(90),rad(0),rad(40))},"Sine","InOut",0.2/speed)
		SetTween(LW,{C0=cf(-1.5, .5 + .05*cos(sine/75), 0) * angles(rad(75),rad(0),rad(-20))},"Sine","InOut",0.2/speed)
		if Anim == "Idle" then
			SetTween(RH,{C0=cf(.6, -1, .2) * angles(rad(0),rad(45),rad(0))},"Sine","InOut",0.2/speed)
			SetTween(LH,{C0=cf(-.6, -1, -.2) * angles(rad(0),rad(45),rad(0))},"Sine","InOut",0.2/speed)
		elseif Anim == "Walk" then
			local RH2 = cf(-forWRL/7 * cos(sine / 75 ),0,forWFB/7 * cos(sine / 75 ))*angles(sin(-forWFB) * cos(sine / 75 ),0,sin(-forWRL) * cos(sine / 75 ))
			local LH2 = cf(forWRL/7 * cos(sine / 75 ),0,-forWFB/7 * cos(sine / 75 ))*angles(sin(forWFB) * cos(sine / 75 ),0,sin(forWRL) * cos(sine / 75 ))
			SetTween(RH,{C0=cf(.5, -0.75+ .35 * sin(sine/75 ), 0+.15* cos(sine/75 ))*RH2 * angles(rad(0 - 5 * cos(sine/75)),rad(45),rad(0))},"Sine","InOut",.07/speed)
			SetTween(LH,{C0=cf(-.5, -0.75- .35 * sin(sine/75 ), 0-.15* cos(sine/75 ))*LH2 * angles(rad(0 + 5 * cos(sine/75)),rad(45),rad(0))},"Sine","InOut",.07/speed)
		end
	end
	coroutine.wrap(function()
		inputremote:FireAllClients("loopfunction",5,"effect","ellipses",v3(0,0,0),trident.CFrame,c3(255,0,0),"Neon",0,workspace,true,false,"Quad",.5,{Size = Vector3.new(1,100,1),Transparency = 1})
		inputremote:FireAllClients("loopfunction",5,"effect","ellipses",v3(0,0,0),trident.CFrame*cf(0,5,0)*angles(random(-180,180),random(-180,180),random(-180,180)),c3(255,0,0),"Neon",0,workspace,true,false,"Quad",1,{Size = Vector3.new(1,100,1),Transparency = 1,Orientation = v3(random(-180,180),random(-180,180),random(-180,180))})
		inputremote:FireAllClients("loopfunction",5,"effect","ellipses",v3(0,0,0),trident.CFrame*cf(0,5,0)*angles(random(-180,180),random(-180,180),random(-180,180)),c3(255,0,0),"Neon",0,workspace,true,false,"Quad",1,{Size = Vector3.new(1,100,1),Transparency = 1,Orientation = v3(random(-180,180),random(-180,180),random(-180,180))})
		inputremote:FireAllClients("loopfunction",5,"effect","ellipses",v3(0,0,0),trident.CFrame*cf(0,5,0)*angles(random(-180,180),random(-180,180),random(-180,180)),c3(255,0,0),"Neon",0,workspace,true,false,"Quad",1,{Size = Vector3.new(1,100,1),Transparency = 1,Orientation = v3(random(-180,180),random(-180,180),random(-180,180))})
		inputremote:FireAllClients("loopfunction",5,"effect","ellipses",v3(0,0,0),trident.CFrame*cf(0,5,0)*angles(random(-180,180),random(-180,180),random(-180,180)),c3(255,0,0),"Neon",0,workspace,true,false,"Quad",1,{Size = Vector3.new(1,100,1),Transparency = 1,Orientation = v3(random(-180,180),random(-180,180),random(-180,180))})
		inputremote:FireAllClients("loopfunction",5,"effect","ball",v3(0,0,0),trident.CFrame*cf(0,5,0),c3(255,0,0),"Neon",0,workspace,true,false,"Quad",.5,{Size = Vector3.new(25,25,25),Transparency = 1,Color = c3(0,0,0)})
		for i,v in pairs(game:GetService("Players"):GetPlayers()) do
			local cs = camshakescript:Clone()
			cs:FindFirstChild("intensity").Value = 1
			cs:FindFirstChild("shaketime").Value = 1
			cs.Parent = v:WaitForChild("Backpack")
			cs.Disabled = false
		end
		for i = 0,5,.1 do
			Swait()
			inputremote:FireAllClients("region3damage","regular",Vector3.new(20,2,20),trident.Position)
			region3damage("regular",Vector3.new(20,2,20),trident.Position)
		end
	end)()
	local es = energystrike:Clone()
	es.Parent = rootpart
	es:Play()
	for i = 0,5,.1 do
		Swait()
		SetTween(tridentweld,{C0=tridentc0*cf(.2, -4, .2) * angles(rad(0), rad(-35), rad(-170))},"Sine","InOut",.03/speed)
		SetTween(RJW,{C0=RootCF*cf(0, 0, 0) * angles(rad(0), rad(0), rad(25))},"Quad","Out",.05/speed)
		SetTween(NeckW,{C0=NeckCF*angles(rad(0), rad(0), rad(-25))},"Quad","InOut",0.00001/speed)
		SetTween(RW,{C0=cf(1.5, .5 + .05*cos(sine/75), -1) * angles(rad(90),rad(0),rad(15))},"Sine","InOut",0.03/speed)
		SetTween(LW,{C0=cf(-1.5, .5 + .05*cos(sine/75), 0) * angles(rad(-15),rad(0),rad(-35))},"Sine","InOut",0.03/speed)
		if Anim == "Idle" then
			SetTween(RH,{C0=cf(.6, -1, -.2) * angles(rad(0),rad(-35),rad(0))},"Quad","InOut",0.00001/speed)
			SetTween(LH,{C0=cf(-.6, -1, .2) * angles(rad(0),rad(-35),rad(0))},"Quad","InOut",0.00001/speed)
		elseif Anim == "Walk" then
			local RH2 = cf(-forWRL/7 * cos(sine / 75 ),0,forWFB/7 * cos(sine / 75 ))*angles(sin(-forWFB) * cos(sine / 75 ),0,sin(-forWRL) * cos(sine / 75 ))
			local LH2 = cf(forWRL/7 * cos(sine / 75 ),0,-forWFB/7 * cos(sine / 75 ))*angles(sin(forWFB) * cos(sine / 75 ),0,sin(forWRL) * cos(sine / 75 ))
			SetTween(RH,{C0=cf(.5, -0.75+ .35 * sin(sine/75 ), 0+.15* cos(sine/75 ))*RH2 * angles(rad(0 - 5 * cos(sine/75)),rad(45),rad(0))},"Sine","InOut",.07/speed)
			SetTween(LH,{C0=cf(-.5, -0.75- .35 * sin(sine/75 ), 0-.15* cos(sine/75 ))*LH2 * angles(rad(0 + 5 * cos(sine/75)),rad(45),rad(0))},"Sine","InOut",.07/speed)
		end
	end
	coroutine.wrap(function()
		pp1.Enabled = false
		pp2.Enabled = false
		wait(2)
		pp1:Destroy()
		pp2:Destroy()
		es:Destroy()
	end)()
	attacking = false
	inputremote:FireAllClients("doidleeffects")
	hum.WalkSpeed = walkspeedval
end
function swing()
	attacking = true
	inputremote:FireAllClients("doidleeffects")
	if swingnum == 1 then
		for i = 0,2,.1 do
			Swait()
			SetTween(tridentweld,{C0=tridentc0*cf(.5, -2, .5) * angles(rad(0), rad(-35), rad(-100))},"Sine","InOut",.05/speed)
			SetTween(RJW,{C0=RootCF*cf(0, 0, 0) * angles(rad(0), rad(0), rad(-45))},"Quad","Out",.1/speed)
			SetTween(NeckW,{C0=NeckCF*angles(rad(0), rad(0), rad(45))},"Quad","InOut",0.05/speed)
			SetTween(RW,{C0=cf(1.5, .5 + .05*cos(sine/75), 0) * angles(rad(90),rad(0),rad(20))},"Sine","InOut",0.07/speed)
			SetTween(LW,{C0=cf(-1.5, .5 + .05*cos(sine/75), 0) * angles(rad(75),rad(0),rad(-20))},"Sine","InOut",0.07/speed)
			if Anim == "Idle" then
				SetTween(RH,{C0=cf(.5, -1, 0) * angles(rad(0),rad(-2),rad(5))},"Quad","InOut",0.07/speed)
				SetTween(LH,{C0=cf(-.5, -1, 0) * angles(rad(0),rad(2),rad(-5))},"Quad","InOut",0.07/speed)
			elseif Anim == "Walk" then
				local RH2 = cf(-forWRL/7 * cos(sine / 20 ),0,forWFB/7 * cos(sine / 20 ))*angles(sin(-forWFB) * cos(sine / 20 ),0,sin(-forWRL) * cos(sine / 20 ))
				local LH2 = cf(forWRL/7 * cos(sine / 20 ),0,-forWFB/7 * cos(sine / 20 ))*angles(sin(forWFB) * cos(sine / 20 ),0,sin(forWRL) * cos(sine / 20 ))
				SetTween(RH,{C0=cf(.5, -0.75+ .35 * sin(sine/20 ), 0+.15* cos(sine/20 ))*RH2 * angles(rad(0 - 5 * cos(sine/20)),rad(45),rad(0))},"Sine","InOut",.07/speed)
				SetTween(LH,{C0=cf(-.5, -0.75- .35 * sin(sine/20 ), 0-.15* cos(sine/20 ))*LH2 * angles(rad(0 + 5 * cos(sine/20)),rad(45),rad(0))},"Sine","InOut",.07/speed)
			end
		end
		coroutine.wrap(function()
			for i = 0,2,.1 do
				Swait()
				inputremote:FireAllClients("region3damage","regular",Vector3.new(10,2,10),trident.Position)
				region3damage("regular",Vector3.new(10,2,10),trident.Position)
			end
		end)()
		for i = 0,2,.1 do
			Swait()
			SetTween(tridentweld,{C0=tridentc0*cf(.2, -4, .2) * angles(rad(0), rad(-35), rad(-170))},"Sine","InOut",.05/speed)
			SetTween(RJW,{C0=RootCF*cf(0, 0, 0) * angles(rad(0), rad(0), rad(25))},"Quad","Out",.1/speed)
			SetTween(NeckW,{C0=NeckCF*angles(rad(0), rad(0), rad(-25))},"Quad","InOut",0.05/speed)
			SetTween(RW,{C0=cf(1.5, .5 + .05*cos(sine/75), -1) * angles(rad(90),rad(0),rad(15))},"Sine","InOut",0.05/speed)
			SetTween(LW,{C0=cf(-1.5, .5 + .05*cos(sine/75), 0) * angles(rad(-15),rad(0),rad(-35))},"Sine","InOut",0.07/speed)
			if Anim == "Idle" then
				SetTween(RH,{C0=cf(.5, -1, 0) * angles(rad(0),rad(-2),rad(5))},"Quad","InOut",0.07/speed)
				SetTween(LH,{C0=cf(-.5, -1, 0) * angles(rad(0),rad(2),rad(-5))},"Quad","InOut",0.07/speed)
			elseif Anim == "Walk" then
				local RH2 = cf(-forWRL/7 * cos(sine / 20 ),0,forWFB/7 * cos(sine / 20 ))*angles(sin(-forWFB) * cos(sine / 20 ),0,sin(-forWRL) * cos(sine / 20 ))
				local LH2 = cf(forWRL/7 * cos(sine / 20 ),0,-forWFB/7 * cos(sine / 20 ))*angles(sin(forWFB) * cos(sine / 20 ),0,sin(forWRL) * cos(sine / 20 ))
				SetTween(RH,{C0=cf(.5, -0.75+ .35 * sin(sine/20 ), 0+.15* cos(sine/20 ))*RH2 * angles(rad(0 - 5 * cos(sine/20)),rad(-25),rad(0))},"Sine","InOut",.07/speed)
				SetTween(LH,{C0=cf(-.5, -0.75- .35 * sin(sine/20 ), 0-.15* cos(sine/20 ))*LH2 * angles(rad(0 + 5 * cos(sine/20)),rad(-25),rad(0))},"Sine","InOut",.07/speed)
			end
		end
		inputremote:FireAllClients("doidleeffects")
		attacking = false
		swingnum = 2
	elseif swingnum == 2 then
		for i = 0,2,.1 do
			Swait()
			SetTween(tridentweld,{C0=tridentc0*cf(.0, -3, -1.1) * angles(rad(0), rad(90), rad(-90))},"Quad","InOut",.05/speed)
			SetTween(RJW,{C0=RootCF*cf(0, 0, 0) * angles(rad(-10), rad(0), rad(0))},"Quad","Out",.2/speed)
			SetTween(NeckW,{C0=NeckCF*angles(rad(5), rad(0), rad(0))},"Quad","InOut",0.05/speed)
			SetTween(RW,{C0=cf(1.5, .5 + .05*cos(sine/75), .4) * angles(rad(90),rad(0),rad(0))},"Sine","InOut",0.05/speed)
			SetTween(LW,{C0=cf(-1.5, .5 + .05*cos(sine/75), .4) * angles(rad(90),rad(0),rad(0))},"Sine","InOut",0.05/speed)
			if Anim == "Idle" then
				SetTween(RH,{C0=cf(.5, -1, 0) * angles(rad(-10),rad(-5),rad(5))},"Quad","InOut",0.05/speed)
				SetTween(LH,{C0=cf(-.5, -1, 0) * angles(rad(-10),rad(5),rad(-5))},"Quad","InOut",0.05/speed)
			elseif Anim == "Walk" then
				local RH2 = cf(-forWRL/7 * cos(sine / 20 ),0,forWFB/7 * cos(sine / 20 ))*angles(sin(-forWFB) * cos(sine / 20 ),0,sin(-forWRL) * cos(sine / 20 ))
				local LH2 = cf(forWRL/7 * cos(sine / 20 ),0,-forWFB/7 * cos(sine / 20 ))*angles(sin(forWFB) * cos(sine / 20 ),0,sin(forWRL) * cos(sine / 20 ))
				SetTween(RH,{C0=cf(.5, -0.75+ .35 * sin(sine/20 ), 0+.15* cos(sine/20 ))*RH2 * angles(rad(0 - 5 * cos(sine/20)),rad(0),rad(0))},"Sine","InOut",.07/speed)
				SetTween(LH,{C0=cf(-.5, -0.75- .35 * sin(sine/20 ), 0-.15* cos(sine/20 ))*LH2 * angles(rad(0 + 5 * cos(sine/20)),rad(0),rad(0))},"Sine","InOut",.07/speed)
			end
		end
		coroutine.wrap(function()
			for i = 0,2,.1 do
				Swait()
				inputremote:FireAllClients("region3damage","regular",Vector3.new(9,2,5),trident.Position)
				region3damage("regular",Vector3.new(9,2,5),trident.Position)
			end
		end)()
		for i = 0,2,.1 do
			Swait()
			SetTween(tridentweld,{C0=tridentc0*cf(.0, -3, -1.1) * angles(rad(0), rad(90), rad(-90))},"Quad","InOut",.05/speed)
			SetTween(RJW,{C0=RootCF*cf(0, 0, 0) * angles(rad(5), rad(0), rad(0))},"Quad","Out",.2/speed)
			SetTween(NeckW,{C0=NeckCF*angles(rad(0), rad(0), rad(0))},"Quad","InOut",0.05/speed)
			SetTween(RW,{C0=cf(1.5, .5 + .05*cos(sine/75), -.8) * angles(rad(90),rad(0),rad(0))},"Sine","InOut",0.05/speed)
			SetTween(LW,{C0=cf(-1.5, .5 + .05*cos(sine/75), -.8) * angles(rad(90),rad(0),rad(0))},"Sine","InOut",0.05/speed)
			if Anim == "Idle" then
				SetTween(RH,{C0=cf(.5, -1, 0) * angles(rad(5),rad(-5),rad(5))},"Quad","InOut",0.05/speed)
				SetTween(LH,{C0=cf(-.5, -1, 0) * angles(rad(5),rad(5),rad(-5))},"Quad","InOut",0.05/speed)
			elseif Anim == "Walk" then
				local RH2 = cf(-forWRL/7 * cos(sine / 20 ),0,forWFB/7 * cos(sine / 20 ))*angles(sin(-forWFB) * cos(sine / 20 ),0,sin(-forWRL) * cos(sine / 20 ))
				local LH2 = cf(forWRL/7 * cos(sine / 20 ),0,-forWFB/7 * cos(sine / 20 ))*angles(sin(forWFB) * cos(sine / 20 ),0,sin(forWRL) * cos(sine / 20 ))
				SetTween(RH,{C0=cf(.5, -0.75+ .35 * sin(sine/20 ), 0+.15* cos(sine/20 ))*RH2 * angles(rad(0 - 5 * cos(sine/20)),rad(0),rad(0))},"Sine","InOut",.07/speed)
				SetTween(LH,{C0=cf(-.5, -0.75- .35 * sin(sine/20 ), 0-.15* cos(sine/20 ))*LH2 * angles(rad(0 + 5 * cos(sine/20)),rad(0),rad(0))},"Sine","InOut",.07/speed)
			end
		end
		inputremote:FireAllClients("doidleeffects")
		attacking = false
		swingnum = 3
	elseif swingnum == 3 then
		for i = 0,2,.1 do
			Swait()
			SetTween(tridentweld,{C0=tridentc0*cf(-.8, 1, .7) * angles(rad(100), rad(180), rad(-35))},"Quad","InOut",.05/speed)
			SetTween(RJW,{C0=RootCF*cf(0, 0, 0) * angles(rad(-10), rad(0), rad(0))},"Quad","Out",.25/speed)
			SetTween(NeckW,{C0=NeckCF*angles(rad(-5), rad(0), rad(0))},"Quad","InOut",0.05/speed)
			SetTween(RW,{C0=cf(1, 1 + .05*cos(sine/75), -.5) * angles(rad(150),rad(0),rad(-30))},"Sine","InOut",0.05/speed)
			SetTween(LW,{C0=cf(-1, 1 + .05*cos(sine/75), -.5) * angles(rad(150),rad(0),rad(30))},"Sine","InOut",0.05/speed)
			if Anim == "Idle" then
				SetTween(RH,{C0=cf(.5, -1, 0) * angles(rad(-10),rad(-5),rad(5))},"Quad","InOut",0.05/speed)
				SetTween(LH,{C0=cf(-.5, -1, 0) * angles(rad(-10),rad(5),rad(-5))},"Quad","InOut",0.05/speed)
			elseif Anim == "Walk" then
				local RH2 = cf(-forWRL/7 * cos(sine / 20 ),0,forWFB/7 * cos(sine / 20 ))*angles(sin(-forWFB) * cos(sine / 20 ),0,sin(-forWRL) * cos(sine / 20 ))
				local LH2 = cf(forWRL/7 * cos(sine / 20 ),0,-forWFB/7 * cos(sine / 20 ))*angles(sin(forWFB) * cos(sine / 20 ),0,sin(forWRL) * cos(sine / 20 ))
				SetTween(RH,{C0=cf(.5, -0.75+ .35 * sin(sine/20 ), 0+.15* cos(sine/20 ))*RH2 * angles(rad(0 - 5 * cos(sine/20)),rad(0),rad(0))},"Sine","InOut",.07/speed)
				SetTween(LH,{C0=cf(-.5, -0.75- .35 * sin(sine/20 ), 0-.15* cos(sine/20 ))*LH2 * angles(rad(0 + 5 * cos(sine/20)),rad(0),rad(0))},"Sine","InOut",.07/speed)
			end
		end
		coroutine.wrap(function()
			for i = 0,2,.1 do
				Swait()
				inputremote:FireAllClients("region3damage","regular",Vector3.new(14,5,14),trident.Position)
				region3damage("regular",Vector3.new(14,5,14),trident.Position)
			end
		end)()
		for i = 0,2,.1 do
			Swait()
			SetTween(tridentweld,{C0=tridentc0*cf(-.8, -1, .7) * angles(rad(100), rad(180), rad(-35))},"Quad","InOut",.05/speed)
			SetTween(RJW,{C0=RootCF*cf(0, 0, 0) * angles(rad(10), rad(0), rad(0))},"Quad","Out",.25/speed)
			SetTween(NeckW,{C0=NeckCF*angles(rad(-5), rad(0), rad(0))},"Quad","InOut",0.05/speed)
			SetTween(RW,{C0=cf(1, .7 + .05*cos(sine/75), -.5) * angles(rad(125),rad(0),rad(-30))},"Sine","InOut",0.05/speed)
			SetTween(LW,{C0=cf(-1, .7 + .05*cos(sine/75), -.5) * angles(rad(125),rad(0),rad(30))},"Sine","InOut",0.05/speed)
			if Anim == "Idle" then
				SetTween(RH,{C0=cf(.5, -1, 0) * angles(rad(10),rad(-5),rad(5))},"Quad","InOut",0.05/speed)
				SetTween(LH,{C0=cf(-.5, -1, 0) * angles(rad(10),rad(5),rad(-5))},"Quad","InOut",0.05/speed)
			elseif Anim == "Walk" then
				local RH2 = cf(-forWRL/7 * cos(sine / 20 ),0,forWFB/7 * cos(sine / 20 ))*angles(sin(-forWFB) * cos(sine / 20 ),0,sin(-forWRL) * cos(sine / 20 ))
				local LH2 = cf(forWRL/7 * cos(sine / 20 ),0,-forWFB/7 * cos(sine / 20 ))*angles(sin(forWFB) * cos(sine / 20 ),0,sin(forWRL) * cos(sine / 20 ))
				SetTween(RH,{C0=cf(.5, -0.75+ .35 * sin(sine/20 ), 0+.15* cos(sine/20 ))*RH2 * angles(rad(0 - 5 * cos(sine/20)),rad(0),rad(0))},"Sine","InOut",.07/speed)
				SetTween(LH,{C0=cf(-.5, -0.75- .35 * sin(sine/20 ), 0-.15* cos(sine/20 ))*LH2 * angles(rad(0 + 5 * cos(sine/20)),rad(0),rad(0))},"Sine","InOut",.07/speed)
			end
		end
		inputremote:FireAllClients("doidleeffects")
		attacking = false
		swingnum = 1
	end
end
local quotes = {
	[1]="...",
	[2]="Why are you getting in my way?",
	[3]="You already knew this was going to happen, why are you trying to stop me?",
	[4]="..."
}
local songlist = {
	["reallywant"]=2303442953,
	["youlove"]=5345455968,
	["leight"]=1680840607,
	["slowing"]=1203808893,
	["ablix"]=1230326804,
	["toyou"]=3475857304,
	["goingback"]=2915250329,
	["daynnite"]=2371543268,
	["rainbowking"]=3522311451,
	["MAYHEM"]=614032233,
	["socialmedia"]=5127063380,
	["21stcentury"]=5482009290,
	["rainbowpuncher"]=2264258418,
	["theme"]=2728315619,
}
function randomquote()
	local randomnum = math.random(1,4)
	for i,v in pairs(quotes) do
		if i == randomnum then
			chatmessage(v)
		end
	end
end
function run()
	if running == false then
		attacking = true
		inputremote:FireAllClients("doidleeffects")
		hum.WalkSpeed = 0
		coroutine.wrap(function()
			for i = 0,5,.1 do
				Swait()
				SetTween(tridentweld,{C0=tridentc0*cf(.3, -3, -1) * angles(rad(-25), rad(90), rad(-70))},"Quad","InOut",.1/speed)
				SetTween(RJW,{C0=RootCF*cf(0, 0, 0) * angles(rad(0), rad(0), rad(0))},"Quad","Out",.3/speed)
				SetTween(NeckW,{C0=NeckCF*angles(rad(10), rad(0), rad(0))},"Quad","InOut",0.1/speed)
				SetTween(RW,{C0=cf(1.5, .5 + .05*cos(sine/75), 0) * angles(rad(90),rad(0),rad(0))},"Sine","InOut",0.1/speed)
				SetTween(LW,{C0=cf(-1.5, .5 + .05*cos(sine/75), 0) * angles(rad(90),rad(0),rad(0))},"Sine","InOut",0.1/speed)
				SetTween(RH,{C0=cf(.5, -1, 0) * angles(rad(0),rad(-5),rad(5))},"Quad","InOut",0.1/speed)
				SetTween(LH,{C0=cf(-.5, -1, 0) * angles(rad(0),rad(5),rad(-5))},"Quad","InOut",0.1/speed)
			end
			local sum = summoning:Clone()
			sum.Parent = rootpart
			sum:Play()
			for i = 0,5,.1 do
				Swait()
				SetTween(tridentweld,{C0=tridentc0*cf(.3, -3, -1) * angles(rad(-25), rad(90), rad(-70))},"Quad","InOut",.1/speed)
				SetTween(RJW,{C0=RootCF*cf(0, 0, 0) * angles(rad(0), rad(0), rad(0))},"Quad","Out",.3/speed)
				SetTween(NeckW,{C0=NeckCF*angles(rad(10), rad(0), rad(0))},"Quad","InOut",0.1/speed)
				SetTween(RW,{C0=cf(1.5, .5 + .05*cos(sine/75), 0) * angles(rad(90),rad(0),rad(-45))},"Sine","InOut",0.1/speed)
				SetTween(LW,{C0=cf(-1.5, .5 + .05*cos(sine/75), 0) * angles(rad(90),rad(0),rad(45))},"Sine","InOut",0.1/speed)
				SetTween(RH,{C0=cf(.5, -1, 0) * angles(rad(0),rad(-5),rad(5))},"Quad","InOut",0.1/speed)
				SetTween(LH,{C0=cf(-.5, -1, 0) * angles(rad(0),rad(5),rad(-5))},"Quad","InOut",0.1/speed)
			end
			wait(2)
			sum:Destroy()
		end)()
	wait(.8)
		trident.fire.Enabled = false
		ts:Create(trident,tweeninfo(1,"Sine","InOut"),{Size = Vector3.new(0,0,0),Transparency = 1}):Play()
		wait(1)
		hum.WalkSpeed = 35
		walkspeedval = 35
		running = true
		inputremote:FireAllClients("doidleeffects")
		attacking = false
	elseif running == true then
		attacking = true
		inputremote:FireAllClients("doidleeffects")
		hum.WalkSpeed = 0
		coroutine.wrap(function()
			for i = 0,5,.1 do
				Swait()
				SetTween(tridentweld,{C0=tridentc0*cf(.3, -3, -1) * angles(rad(-25), rad(90), rad(-70))},"Quad","InOut",.1/speed)
				SetTween(RJW,{C0=RootCF*cf(0, 0, 0) * angles(rad(0), rad(0), rad(0))},"Quad","Out",.3/speed)
				SetTween(NeckW,{C0=NeckCF*angles(rad(10), rad(0), rad(0))},"Quad","InOut",0.1/speed)
				SetTween(RW,{C0=cf(1.5, .5 + .05*cos(sine/75), 0) * angles(rad(90),rad(0),rad(-45))},"Sine","InOut",0.1/speed)
				SetTween(LW,{C0=cf(-1.5, .5 + .05*cos(sine/75), 0) * angles(rad(90),rad(0),rad(45))},"Sine","InOut",0.1/speed)
				SetTween(RH,{C0=cf(.5, -1, 0) * angles(rad(0),rad(-5),rad(5))},"Quad","InOut",0.1/speed)
				SetTween(LH,{C0=cf(-.5, -1, 0) * angles(rad(0),rad(5),rad(-5))},"Quad","InOut",0.1/speed)
			end
			local sum = summoning:Clone()
			sum.Parent = rootpart
			sum:Play()
			for i = 0,5,.1 do
				Swait()
				SetTween(tridentweld,{C0=tridentc0*cf(.3, -3, -1) * angles(rad(-25), rad(90), rad(-70))},"Quad","InOut",.1/speed)
				SetTween(RJW,{C0=RootCF*cf(0, 0, 0) * angles(rad(0), rad(0), rad(0))},"Quad","Out",.3/speed)
				SetTween(NeckW,{C0=NeckCF*angles(rad(10), rad(0), rad(0))},"Quad","InOut",0.1/speed)
				SetTween(RW,{C0=cf(1.5, .5 + .05*cos(sine/75), .2) * angles(rad(90),rad(0),rad(0))},"Sine","InOut",0.1/speed)
				SetTween(LW,{C0=cf(-1.5, .5 + .05*cos(sine/75), -.2) * angles(rad(90),rad(0),rad(0))},"Sine","InOut",0.1/speed)
				SetTween(RH,{C0=cf(.5, -1, 0) * angles(rad(0),rad(-5),rad(5))},"Quad","InOut",0.1/speed)
				SetTween(LH,{C0=cf(-.5, -1, 0) * angles(rad(0),rad(5),rad(-5))},"Quad","InOut",0.1/speed)
			end
			trident.fire.Enabled = true
			wait(.5)
			local gr = grabsound:Clone()
			gr.Parent = rootpart
			gr:Play()
			wait(1)
			gr:Destroy()
			sum:Destroy()
		end)()
		wait(.8)
		ts:Create(trident,tweeninfo(1,"Sine","InOut"),{Size = tridentsize,Transparency = 0}):Play()
		wait(1)
		walkspeedval = 20
		hum.WalkSpeed = 20
		running = false
		inputremote:FireAllClients("doidleeffects")
		attacking = false
	end
end
rootpart.ChildRemoved:Connect(function()
	if not rootpart:FindFirstChild("The last soul") then
		theme = makesound({rootpart,origid,volume,true,true,"The last soul",10})
	end
end)
plr.Chatted:Connect(function(m)
	if sub(m,0,12) == "/e visualize" then
		inputremote:FireAllClients("visualizemusic")
	elseif sub(m,0,5) == "/e id" then
		local h = 0
		for i,v in pairs(songlist) do
			if sub(m,7) == i then
				theme.SoundId = "rbxassetid://"..v
				origid = v
				h = h + 1
			end
		end
		theme.TimePosition = 0
		if h == 0 then
			theme.SoundId = "rbxassetid://"..sub(m,7)
			origid = sub(m,7)
		end
	elseif sub(m,0,16) == "/e effectstoggle" then
		inputremote:FireAllClients("doidleffectsperm")
	elseif sub(m,0,10) == "/e timepos" then
		theme.TimePosition = sub(m,12)
	elseif sub(m,0,6) == "/e vol" then
		theme.Volume = sub(m,8)
		volume = sub(m,8)
	elseif sub(m,0,11) == "/e emitsize" then
		theme.EmitterSize = sub(m,13)
	else
		chatmessage(m)
	end
end)
inputremote.OnServerEvent:Connect(function(player,inputtype,key)
	if inputtype == "buttondown" and attacking == false and running == false then
		swing()
	elseif inputtype == "buttonup" then
	elseif inputtype == "keydown" and key == "e" and attacking == false and running == false then
		coloredswing()
	elseif inputtype == "keydown" and key == "t" then
		randomquote()
	elseif inputtype == "keydown" and key == "n" and swingspeed > .3 then
		swingspeed = swingspeed - .05
		print(swingspeed)
		chatmessage(plr.Name.. " increased their attack speed!")
	elseif inputtype == "keydown" and key == "m" and swingspeed < .6 then
		swingspeed = swingspeed + .05
		print(swingspeed)
		chatmessage(plr.Name.. " decreased their attack speed!")
	elseif inputtype == "keydown" and key == "r" and attacking == false and running == false then
		earthquake()
	elseif inputtype == "keydown" and key == "z" and attacking == false then
		run()
	elseif inputtype == "keydown" and key == "f" and attacking == false and running == false then
		ultrastab()
	elseif inputtype == "keydown" and key == "g" and attacking == false then
		handfire()
	elseif inputtype == "keyup" then
		holding = false
	elseif inputtype == "mousepos" then
		print("found")
		mousepos = key
		repeat wait(.1) until nilmousepos == true
		mousepos = nil
		nilmousepos = false
	elseif inputtype == "lookvector" then
		lookvector = key
	end
end)
coroutine.wrap(function()
	wait(49)
	local rays = Instance.new("SunRaysEffect",game:GetService("Lighting"))
	rays.Intensity = 0
	rays.Name = "rays"
	ts:Create(rays,tweeninfo(1,"Sine","InOut"),{Intensity = .15}):Play()
	local as = atmosphere:Clone()
	as.Parent = game:GetService("Lighting")
	ts:Create(as,tweeninfo(1,"Sine","InOut"),{TintColor = Color3.new(1, 0.486275, 0.494118)}):Play()
	if workspace:FindFirstChild("Baseplate") then
		baseplatefire:Clone().Parent = workspace:FindFirstChild("Baseplate")
	elseif workspace:FindFirstChild("Base") then
		baseplatefire:Clone().Parent = workspace:FindFirstChild("Base")
	end
	wait(1)
	lightingeffects = true
	baseplateparticles = true
	idleeffects = true
	for i = 0,35,1 do
		Swait()
		local meshpart = Instance.new("Part",headshadingfolder)
		local mesh = Instance.new("SpecialMesh",meshpart)
		mesh.MeshType = "Head"
		mesh.Scale = Vector3.new(1.25,1.25,1.25)
		mesh.VertexColor = Vector3.new(1,1,1)
		meshpart.CanCollide = false
		meshpart.Color = Color3.fromRGB(0,0,0)
		meshpart.Material = Enum.Material.Fabric
		meshpart.Transparency = i/35
		meshpart.Position = torso.Position
		meshpart.Size = Vector3.new(1.01, 0.65, 1.01)
		meshpart.formFactor = 3
		local weld = Instance.new("Weld",meshpart)
		weld.Part0 = char.Head
		weld.Part1 = meshpart
		weld.C0 = CFrame.new(0, 0.28 - (i - 1) / 110, 0)
		weld.C1 = CFrame.new(0,0,0)
	end
end)()
coroutine.wrap(function()
	repeat wait(.1) until idleeffects == true
	inputremote:FireAllClients("doidleeffects")
	local c = 0
end)()
workspace.Terrain:ClearAllChildren()
game:GetService("RunService").Heartbeat:Connect(function()
	Swait()
	game.JointsService:ClearAllChildren()
	sine = sine + change
	local hitfloor = rayCast(rootpart.Position, cf(rootpart.Position, rootpart.Position - Vector3.new(0, 1, 0)).lookVector, 4, char)
	local Ccf=torso.CFrame
	local Walktest1 = hum.MoveDirection*Ccf.LookVector
	local Walktest2 = hum.MoveDirection*Ccf.RightVector
	forWFB = Walktest1.X+Walktest1.Z
	forWRL = Walktest2.X+Walktest2.Z
	local torvel = (hum.MoveDirection * Vector3.new(1, 0, 1)).magnitude
	if rootpart.Velocity.y > 1 and hitfloor == nil then
		Anim = "Jump"
	elseif rootpart.Velocity.y < -1 and hitfloor == nil then
		Anim = "Fall"
	elseif hum.Sit == true then
		Anim = "Sit"
	elseif torvel < .5 and hitfloor ~= nil  then
		Anim = "Idle"
	elseif torvel > .5 and  hitfloor ~= nil  then
		Anim = "Walk"
	else
		Anim = ""
	end
	hum.MaxHealth = 0/0
	hum.Health = 0/0
	sine = sine + change
	if attacking == false then
		if Anim == "Walk" then
			if running == false then
				local RH2 = cf(-forWRL/7 * cos(sine / 25 ),0,forWFB/7 * cos(sine / 25 ))*angles(sin(-forWFB) * cos(sine / 25 ),0,sin(-forWRL) * cos(sine / 25 ))
				local LH2 = cf(forWRL/7 * cos(sine / 25 ),0,-forWFB/7 * cos(sine / 25 ))*angles(sin(forWFB) * cos(sine / 25 ),0,sin(forWRL) * cos(sine / 25 ))
				SetTween(tridentweld,{C0=tridentc0*cf(.6, -3, -.4) * angles(rad(-25), rad(35), rad(-80))},"Quad","InOut",.1/speed)
				SetTween(RJW,{C0=RootCF*cf(0, 0 , -0.185 + 0.055 * cos(sine / 25) + -sin(sine / 25) / 8) * angles(rad((forWFB*2  - forWFB)*4), rad((-forWRL - -forWRL)*2) , rad(25*forWRL+8 ))},"Quad","InOut",.1/speed)
				SetTween(NeckW,{C0=NeckCF*cf(0, 0, 0) * angles((rad(20+(-forWFB*2 - -forWFB  )*8))+rad(0), rad((forWRL - forWRL)*1)+rad(0), rad(-45*forWRL-2))},"Quad","InOut",.1/speed)
				SetTween(RW,{C0=cf(1.5, .5 + .05*cos(sine/75), .2) * angles(rad(105 - 2*cos(sine/150)),rad(0),rad(0))},"Sine","InOut",0.1/speed)
				SetTween(LW,{C0=cf(-1.5, .5 + .05*cos(sine/75), -.2) * angles(rad(55 - 2*cos(sine/150)),rad(0),rad(0))},"Sine","InOut",0.1/speed)
				SetTween(RH,{C0=cf(.5, -0.75+ .35 * sin(sine/25 ), 0+.15* cos(sine/25 ))*RH2 * angles(rad(0 - 5 * cos(sine/25)),rad(0),rad(2.5- 0.0 * cos(sine/25)))},"Sine","InOut",.1/speed)
				SetTween(LH,{C0=cf(-.5, -0.75- .35 * sin(sine/25 ), 0-.15* cos(sine/25 ))*LH2 * angles(rad(0 + 5 * cos(sine/25)),rad(0),rad(-2.5- 0.0 * cos(sine/25)))},"Sine","InOut",.1/speed)
			elseif running == true then
				local RH2 = cf(-forWRL/7 * cos(sine / 20 ),0,forWFB/7 * cos(sine / 20 ))*angles(sin(-forWFB) * cos(sine / 20 ),0,sin(-forWRL) * cos(sine / 20 ))
				local LH2 = cf(forWRL/7 * cos(sine / 20 ),0,-forWFB/7 * cos(sine / 20 ))*angles(sin(forWFB) * cos(sine / 20 ),0,sin(forWRL) * cos(sine / 20 ))
				SetTween(tridentweld,{C0=tridentc0*cf(.6, -3, -.4) * angles(rad(-25), rad(35), rad(-80))},"Sine","InOut",.1/speed)
				SetTween(RJW,{C0=RootCF*cf(0, 0 , -0.185 + 0.055 * cos(sine / 20) + -sin(sine / 20) / 8) * angles(rad((forWFB*2  - forWFB*cos(sine/20))*4), rad((-forWRL - -forWRL*cos(sine/20))*2) , rad(25*forWRL-10  *cos(sine/20)))},"Sine","InOut",.07/speed)
				SetTween(NeckW,{C0=NeckCF*cf(0, 0, 0) * angles((rad(20+(-forWFB*2 - -forWFB  )*8))+rad(0), rad((forWRL - forWRL)*1)+rad(0), rad(-45*forWRL-2))},"Sine","InOut",.07/speed)
				SetTween(RW,{C0=cf(1.5, .5 + .08*cos(sine/75), 0) * angles(rad(0-forWFB*75*cos(sine/20)),rad(0+forWFB*20*cos(sine/20)),rad(0+forWFB*20*cos(sine/20)))},"Sine","InOut",.05/speed)
				SetTween(LW,{C0=cf(-1.5, .5 + .08*cos(sine/75), 0) * angles(rad(0+forWFB*75*cos(sine/20)),rad(0+forWFB*20*cos(sine/20)),rad(0+forWFB*20*cos(sine/20)))},"Sine","InOut",.05/speed)
				SetTween(RH,{C0=cf(.5, -0.75+ .35 * sin(sine/20 ), 0+.15* cos(sine/20 ))*RH2 * angles(rad(0 - 5 * cos(sine/20)),rad(0),rad(2.5- 0.0 * cos(sine/20)))},"Sine","InOut",.05/speed)
				SetTween(LH,{C0=cf(-.5, -0.75- .35 * sin(sine/20 ), 0-.15* cos(sine/20 ))*LH2 * angles(rad(0 + 5 * cos(sine/20)),rad(0),rad(-2.5- 0.0 * cos(sine/20)))},"Sine","InOut",.05/speed)
			end
		elseif Anim == "Idle" then
			if running == false then
				SetTween(tridentweld,{C0=tridentc0*cf(.6, -3, -.4) * angles(rad(-25), rad(35), rad(-80))},"Quad","InOut",.1/speed)
				SetTween(RJW,{C0=RootCF*cf(0, 0, 0) * angles(rad(0), rad(0), rad(10))},"Quad","Out",.3/speed)
				SetTween(NeckW,{C0=NeckCF*angles(rad(30 + 2*cos(sine/75)), rad(0), rad(-10))},"Quad","InOut",0.1/speed)
				SetTween(RW,{C0=cf(1.5, .5 + .05*cos(sine/75), .2) * angles(rad(105 - 2*cos(sine/150)),rad(0),rad(0))},"Sine","InOut",0.1/speed)
				SetTween(LW,{C0=cf(-1.5, .5 + .05*cos(sine/75), -.2) * angles(rad(55 - 2*cos(sine/150)),rad(0),rad(0))},"Sine","InOut",0.1/speed)
				SetTween(RH,{C0=cf(.5, -1, 0) * angles(rad(0),rad(-5),rad(5))},"Quad","InOut",0.1/speed)
				SetTween(LH,{C0=cf(-.5, -1, 0) * angles(rad(0),rad(5),rad(-5))},"Quad","InOut",0.1/speed)
			elseif running == true then
				SetTween(tridentweld,{C0=tridentc0*cf(.6, -3, -.4) * angles(rad(-25), rad(35), rad(-80))},"Quad","InOut",.1/speed)
				SetTween(RJW,{C0=RootCF*cf(0, 0, 0) * angles(rad(0), rad(0), rad(10))},"Quad","Out",.3/speed)
				SetTween(NeckW,{C0=NeckCF*angles(rad(0+2*cos(sine/150)), rad(0), rad(-10))},"Quad","InOut",0.1/speed)
				SetTween(RW,{C0=cf(1.5, .5 + .05*cos(sine/75), .1) * angles(rad(0),rad(-10),rad(5 - 2*cos(sine/150)))},"Sine","InOut",0.1/speed)
				SetTween(LW,{C0=cf(-1.5, .5 + .05*cos(sine/75), .1) * angles(rad(0),rad(10),rad(-5 + 2*cos(sine/150)))},"Sine","InOut",0.1/speed)
				SetTween(RH,{C0=cf(.5, -1, 0) * angles(rad(0),rad(-5),rad(5))},"Quad","InOut",0.1/speed)
				SetTween(LH,{C0=cf(-.5, -1, 0) * angles(rad(0),rad(5),rad(-5))},"Quad","InOut",0.1/speed)
			end
		elseif Anim == "Jump" then
			change = 0.60*2
			SetTween(tridentweld,{C0=tridentc0*cf(0, -2, 0) * angles(rad(0), rad(-35), rad(-190))},"Quad","InOut",.05/speed)
			SetTween(RJW,{C0=RootCF* cf(0, 0 + (0.0395/2) * cos(sine / 250), -0.1 + 0.0395 * cos(sine / 250)) * angles(rad(-6.5 - 1.5 * cos(sine / 250))+(0*forWFB)/2, rad(0)-(0*forWRL)/2, rad(0))},"Quad","Out",0.25)
			SetTween(NeckW,{C0=NeckCF*cf(0,0,0)*angles(rad(-26.5 + 2.5 * cos(sine / 250)), rad(0), rad(-0))},"Quad","Out",0.25)
			SetTween(RW,{C0=cf(1.5, .5 + .05 * cos(sine / 250), 0) * angles(rad(20 - 2 * cos(sine / 250 )), rad(-5), rad(8 + 4 * cos(sine / 250)))},"Quad","Out",0.2)
			SetTween(LW,{C0=cf(-1.5, .5 + .05 * cos(sine / 250), 0) * angles(rad(20 - 2 * cos(sine / 250 )), rad(5), rad(-8 - 4 * cos(sine / 250 )))},"Quad","Out",0.2)
			SetTween(RH,{C0=cf(.5, -.5,-.3) * angles(rad(-15 -1* cos(sine / 20)),rad(0),rad(0))},"Quad","InOut",0.075)
			SetTween(LH,{C0=cf(-.5, -.8,-.1) * angles(rad(-25 +1* cos(sine / 20)),rad(0),rad(0))},"Quad","InOut",0.075)
		elseif Anim == "Fall" then
			change = 0.60*2
			SetTween(RJW,{C0=RootCF*cf(0, 0 + (0.0395/2) * cos(sine / 250), -0.5 + 0.0395 * cos(sine / 250)) * angles(rad(-torso.Velocity.Y/6)-(0*forWFB)/2, rad(0)+(0*forWRL)/2, rad(0))},"Quad","Out",0.35)
			SetTween(NeckW,{C0=NeckCF*cf(0,0,0)*angles(rad(26.5 + 2.5 * cos(sine / 250)), rad(0), rad(-0))},"Quad","Out",0.25)
			SetTween(RW,{C0=cf(1.5, .5 + .05 * cos(sine / 250), 0) * angles(rad(105 - 2 * cos(sine / 250 )), rad(-15), rad(80 + 4 * cos(sine / 250)))},"Quad","Out",0.2)
			SetTween(LW,{C0=cf(-1.5, .5 + .05 * cos(sine / 250), 0) * angles(rad(105 - 2 * cos(sine / 250 )), rad(15), rad(-80 - 4 * cos(sine / 250 )))},"Quad","Out",0.2)
			SetTween(RH,{C0=cf(.5, -.5,-.3) * angles(rad(-15),rad(0),rad(0))},"Quad","InOut",0.075)
			SetTween(LH,{C0=cf(-.5, -.8,-.1) * angles(rad(-25),rad(0),rad(0))},"Quad","InOut",0.075)
		end
	end
end)
end)()

-- ------------------------------------------------------

-- [ModuleScript] Unknown
local Unknown_3 = (function()
local ts = game:GetService("TweenService")
local fr = script.Parent.main
local img = fr.head
local tl = fr.text
local msg = script:WaitForChild("text").Value
function tweeninfo(tweentime,easestyle,easingdirection)
	return TweenInfo.new(tweentime,Enum.EasingStyle[easestyle],Enum.EasingDirection[easingdirection])
end
ts:Create(fr,tweeninfo(2,"Sine","InOut"),{Position = UDim2.new(0.01, 0,0.02, 0)}):Play()
wait(1.7)
coroutine.wrap(function()
	while script.Parent.Parent ~= nil do
		ts:Create(fr,tweeninfo(1,"Sine","InOut"),{BackgroundColor3 = Color3.fromRGB(25,25,25)}):Play()
		ts:Create(fr,tweeninfo(1,"Sine","InOut"),{BorderColor3 = Color3.fromRGB(225,225,225)}):Play()
		wait(1)
		ts:Create(fr,tweeninfo(1,"Sine","InOut"),{BackgroundColor3 = Color3.fromRGB(0,0,0)}):Play()
		ts:Create(fr,tweeninfo(1,"Sine","InOut"),{BorderColor3 = Color3.fromRGB(255,255,255)}):Play()
		wait(1)
	end
	print("gone")
end)()
ts:Create(img,tweeninfo(1,"Quad","In"),{ImageTransparency = 0}):Play()
wait(.7)
local teckst = ""
for i = 1,#msg do
	game:GetService("RunService").Stepped:wait()
	teckst = msg:sub(1,i)
	tl.Text = teckst
end
wait(3+(#msg/15))
ts:Create(fr,tweeninfo(3,"Sine","InOut"),{BackgroundTransparency = 1}):Play()
ts:Create(tl,tweeninfo(3,"Sine","InOut"),{TextTransparency = 1}):Play()
ts:Create(img,tweeninfo(3,"Sine","InOut"),{ImageTransparency = 1}):Play()
wait(3)
script.Parent:Destroy()
end)()
