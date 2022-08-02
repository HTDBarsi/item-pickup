-- Gui to Lua
-- Version: 3.2

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local ScrollingFrame = Instance.new("ScrollingFrame")
local UIGridLayout = Instance.new("UIGridLayout")
local obj = Instance.new("Folder")
local TextButton = Instance.new("TextButton")
local UICorner_2 = Instance.new("UICorner")

--Properties:

ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.0640155226, 0, 0.391359597, 0)
Frame.Size = UDim2.new(0, 500, 0, 300)

UICorner.CornerRadius = UDim.new(0, 5)
UICorner.Parent = Frame

ScrollingFrame.Parent = Frame
ScrollingFrame.Active = true
ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScrollingFrame.BackgroundTransparency = 1.000
ScrollingFrame.BorderSizePixel = 0
ScrollingFrame.Size = UDim2.new(1, 0, 1, 0)

UIGridLayout.Parent = ScrollingFrame
UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder

obj.Name = "obj"
obj.Parent = Frame

TextButton.Parent = obj
TextButton.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
TextButton.Size = UDim2.new(0, 200, 0, 50)
TextButton.Visible = false
TextButton.Font = Enum.Font.SourceSans
TextButton.Text = "Item1"
TextButton.TextColor3 = Color3.fromRGB(220, 220, 220)
TextButton.TextScaled = true
TextButton.TextSize = 14.000
TextButton.TextWrapped = true

UICorner_2.Parent = TextButton

-- Scripts:

local function IPWO_fake_script() -- Frame.Smooth GUI Dragging 
	local script = Instance.new('Folder', Frame)

	local UserInputService = game:GetService("UserInputService")
	local runService = (game:GetService("RunService"));
	
	local gui = script.Parent
	
	local dragging
	local dragInput
	local dragStart
	local startPos
	
	function Lerp(a, b, m)
		return a + (b - a) * m
	end;
	
	local lastMousePos
	local lastGoalPos
	local DRAG_SPEED = (8); -- // The speed of the UI darg.
	function Update(dt)
		if not (startPos) then return end;
		if not (dragging) and (lastGoalPos) then
			gui.Position = UDim2.new(startPos.X.Scale, Lerp(gui.Position.X.Offset, lastGoalPos.X.Offset, dt * DRAG_SPEED), startPos.Y.Scale, Lerp(gui.Position.Y.Offset, lastGoalPos.Y.Offset, dt * DRAG_SPEED))
			return 
		end;
	
		local delta = (lastMousePos - UserInputService:GetMouseLocation())
		local xGoal = (startPos.X.Offset - delta.X);
		local yGoal = (startPos.Y.Offset - delta.Y);
		lastGoalPos = UDim2.new(startPos.X.Scale, xGoal, startPos.Y.Scale, yGoal)
		gui.Position = UDim2.new(startPos.X.Scale, Lerp(gui.Position.X.Offset, xGoal, dt * DRAG_SPEED), startPos.Y.Scale, Lerp(gui.Position.Y.Offset, yGoal, dt * DRAG_SPEED))
	end;
	
	gui.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = gui.Position
			lastMousePos = UserInputService:GetMouseLocation()
	
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	
	gui.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	
	runService.Heartbeat:Connect(Update)
end
coroutine.wrap(IPWO_fake_script)()
local function ACGZ_fake_script() -- ScrollingFrame.LocalScript 
	local script = Instance.new('Folder', ScrollingFrame)

	for i,v in next, workspace:GetChildren() do 
		if v:IsA("Tool") and v:FindFirstChild("Handle") then
			local b = script.Parent.Parent.obj.TextButton:Clone()
			b.Visible = true
			b.Parent = script.Parent
			b.Text = v.Name
			b.MouseButton1Click:Connect(function()
				firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,v.Handle,0)
				firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,v.Handle,1)
				task.wait()
				b:Destroy()
			end)
			task.spawn(function()
				while task.wait() do 
					if v.Parent ~= workspace then b:Destroy() end
				end
			end)
		end
	end
	
	workspace.ChildAdded:Connect(function(v)
		if v:IsA("Tool") and v:FindFirstChild("Handle") then
			local b = script.Parent.Parent.obj.TextButton:Clone()
			b.Visible = true
			b.Parent = script.Parent
			b.Text = v.Name
			b.MouseButton1Click:Connect(function()
				firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,v.Handle,0)
				firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,v.Handle,1)
				task.wait()
				b:Destroy()
			end)
			task.spawn(function()
				while task.wait() do 
					if v.Parent ~= workspace then b:Destroy() end
				end
			end)
		end
	end)
end
coroutine.wrap(ACGZ_fake_script)()
