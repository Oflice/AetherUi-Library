local lib = {}
local sections = {}

function lib:AddSection(name)
	table.insert(sections, {name = {}})
end

function lib:AddButton(name)
	table.insert(sections[#sections].name, {
		name = {
			text = name,
			callback = callback or nil
		}
	})
end

function lib:PressButton(sectionIndex, buttonIndex)
	local button = sections[sectionIndex].name[buttonIndex]
	if button and button.name.callback then
		print("Button '" .. button.name.text .. "' pressed.")
		button.name.callback()
	else
		print("No callback set or button not found.")
	end
end

function CreateButtonsForSection(player, sectionIndex)
	local selectedSection = sections[sectionIndex]

	if not selectedSection or not selectedSection.name then
		print("Invalid section index or no buttons in section.")
		return
	end

	local scrollingFrame = player:WaitForChild("PlayerGui")
		:WaitForChild("AetherUI")
		:WaitForChild("AetherUI_Frame")
		:WaitForChild("RightSide")
		:WaitForChild("Fnc_9")
		:WaitForChild("ScrollingFrame")
	for i, v in pairs(scrollingFrame:GetChildren()) do
		if v:IsA("TextButton") then
			v:Destroy()
		end
	end

	for i, buttonData in ipairs(selectedSection.name) do
		local button = Instance.new("TextButton")

		button.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
		button.TextColor3 = Color3.new(0, 0, 0)
		button.TextScaled = true
		button.TextSize = 14
		button.TextWrapped = true
		button.BackgroundColor3 = Color3.new(1, 1, 1)
		button.BackgroundTransparency = 0.5
		button.BorderColor3 = Color3.new(0, 0, 0)
		button.BorderSizePixel = 0
		button.Position = UDim2.new(0.0245, 0, 0.1963 + (i - 1) * 0.2, 0)
		button.Size = UDim2.new(0.92, 0, 0.1587, 0)
		button.Name = "Button_" .. i
		button.Text = buttonData.name.text
		button.Parent = scrollingFrame
		
		local UICorner4 = Instance.new("UICorner")
		UICorner4.Parent = button
		local UIStroke = Instance.new("UIStroke")
		UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		UIStroke.Parent = button

		if buttonData.name.callback then
			button.MouseButton1Click:Connect(buttonData.name.callback)
		end
	end
end

function lib:SelectSection()
	local scrollingFrame = player:WaitForChild("PlayerGui")
		:WaitForChild("AetherUI")
		:WaitForChild("AetherUI_Frame")
		:WaitForChild("LeftSide")
		:WaitForChild("List")

	for _, v in pairs(scrollingFrame:GetChildren()) do
		v.MouseButton1Click:Connect(function()
			local sectionIndex = tonumber(string.sub(v.Name, 8))
			if sectionIndex then
				self:CreateButtonsForSection(player, sectionIndex)
			else
				warn("Invalid section index for button: " .. v.Name)
			end
		end)
	end
end

function lib:Init(player)

for _, v in pairs(player.PlayerGui:GetChildren()) do
	if v.Name == "AetherUI" then
		v:Destroy()
	end
end
	
local AetherUI = Instance.new("ScreenGui")
AetherUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
AetherUI.Name = "AetherUI"
AetherUI.Parent = player.PlayerGui
AetherUI.Enabled = true
local AetherUI_Frame = Instance.new("Frame")
AetherUI_Frame.BackgroundColor3 = Color3.new(1,1,1)
AetherUI_Frame.BorderColor3 = Color3.new(0,0,0)
AetherUI_Frame.BorderSizePixel = 0
AetherUI_Frame.Position = UDim2.new(0.3156779706478119,0,0.2531645596027374,0)
AetherUI_Frame.Size = UDim2.new(0.4226277470588684,0,0.4849246144294739,0)
AetherUI_Frame.Name = "AetherUI_Frame"
AetherUI_Frame.Parent = AetherUI
local UICorner = Instance.new("UICorner")
UICorner.Parent = AetherUI_Frame
local RightSide = Instance.new("Frame")
RightSide.BackgroundColor3 = Color3.new(1,1,1)
RightSide.BackgroundTransparency = 0.4000000059604645
RightSide.BorderColor3 = Color3.new(0,0,0)
RightSide.BorderSizePixel = 0
RightSide.Position = UDim2.new(0.40069085359573364,0,0,0)
RightSide.Size = UDim2.new(0.5993091464042664,0,1,0)
RightSide.Name = "RightSide"
RightSide.Parent = AetherUI_Frame
local UICorner1 = Instance.new("UICorner")
UICorner1.Parent = RightSide
local Scr_Title = Instance.new("TextLabel")
Scr_Title.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json",Enum.FontWeight.Regular,Enum.FontStyle.Normal)
Scr_Title.Text = "AetherUi"
Scr_Title.TextColor3 = Color3.new(0.13333334028720856,0.13333334028720856,0.13333334028720856)
Scr_Title.TextScaled = true
Scr_Title.TextSize = 14
Scr_Title.TextWrapped = true
Scr_Title.BackgroundColor3 = Color3.new(1,1,1)
Scr_Title.BackgroundTransparency = 1
Scr_Title.BorderColor3 = Color3.new(0,0,0)
Scr_Title.BorderSizePixel = 0
Scr_Title.Position = UDim2.new(-0.0027673374861478806,0,0,0)
Scr_Title.Size = UDim2.new(1,0,0.12953367829322815,0)
Scr_Title.Name = "Scr_Title"
Scr_Title.Parent = RightSide
local UICorner2 = Instance.new("UICorner")
UICorner2.Parent = Scr_Title
local Fnc_9 = Instance.new("Frame")
Fnc_9.BackgroundColor3 = Color3.new(1,1,1)
Fnc_9.BackgroundTransparency = 0.5
Fnc_9.BorderColor3 = Color3.new(0,0,0)
Fnc_9.BorderSizePixel = 0
Fnc_9.Position = UDim2.new(0.020172910764813423,0,0.12953367829322815,0)
Fnc_9.Size = UDim2.new(0.939481258392334,0,0.8445596098899841,0)
Fnc_9.Name = "Fnc_9"
Fnc_9.Parent = RightSide
local UICorner3 = Instance.new("UICorner")
UICorner3.Parent = Fnc_9
local ScrollingFrame = Instance.new("ScrollingFrame")
ScrollingFrame.ScrollBarImageColor3 = Color3.new(0,0,0)
ScrollingFrame.Active = true
ScrollingFrame.BackgroundColor3 = Color3.new(1,1,1)
ScrollingFrame.BackgroundTransparency = 1
ScrollingFrame.BorderColor3 = Color3.new(0,0,0)
ScrollingFrame.BorderSizePixel = 0
ScrollingFrame.Position = UDim2.new(0,0,0.033742330968379974,0)
ScrollingFrame.Size = UDim2.new(1,0,0.9662576913833618,0)
ScrollingFrame.Parent = Fnc_9
--[[
local Example_Button = Instance.new("TextButton")
Example_Button.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json",Enum.FontWeight.Regular,Enum.FontStyle.Normal)
Example_Button.TextColor3 = Color3.new(0,0,0)
Example_Button.TextScaled = true
Example_Button.TextSize = 14
Example_Button.TextWrapped = true
Example_Button.BackgroundColor3 = Color3.new(1,1,1)
Example_Button.BackgroundTransparency = 0.5
Example_Button.BorderColor3 = Color3.new(0,0,0)
Example_Button.BorderSizePixel = 0
Example_Button.Position = UDim2.new(0.024539876729249954,0,0.19631901383399963,0)
Example_Button.Size = UDim2.new(0.9202454090118408,0,0.1587301641702652,0)
Example_Button.Name = "Example_Button"
Example_Button.Parent = ScrollingFrame

local UICorner4 = Instance.new("UICorner")
UICorner4.Parent = Example_Button
local UIStroke = Instance.new("UIStroke")
UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke.Parent = Example_Button
]]
local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Padding = UDim.new(0,3)
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Parent = ScrollingFrame
local Close = Instance.new("TextButton")
Close.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json",Enum.FontWeight.Regular,Enum.FontStyle.Normal)
Close.Text = "X"
Close.TextColor3 = Color3.new(1,1,1)
Close.TextScaled = true
Close.TextSize = 14
Close.TextWrapped = true
Close.BackgroundColor3 = Color3.new(0.6666666865348816,0,0)
Close.BackgroundTransparency = 0.20000000298023224
Close.BorderColor3 = Color3.new(0,0,0)
Close.BorderSizePixel = 0
Close.Position = UDim2.new(0.8530259132385254,0,0,0)
Close.Size = UDim2.new(0.14409221708774567,0,0.12953367829322815,0)
Close.Name = "Close"
Close.Parent = RightSide
Close.MouseButton1Click:Connect(function()
	AetherUI.Enabled = false
end)
local UICorner5 = Instance.new("UICorner")
UICorner5.Parent = Close
local LeftSide = Instance.new("Frame")
LeftSide.BackgroundColor3 = Color3.new(1,1,1)
LeftSide.BackgroundTransparency = 1
LeftSide.BorderColor3 = Color3.new(0,0,0)
LeftSide.BorderSizePixel = 0
LeftSide.Size = UDim2.new(0.39896371960639954,0,1,0)
LeftSide.Name = "LeftSide"
LeftSide.Parent = AetherUI_Frame
local UICorner6 = Instance.new("UICorner")
UICorner6.Parent = LeftSide
local PlrInfo = Instance.new("Frame")
PlrInfo.BackgroundColor3 = Color3.new(1,1,1)
PlrInfo.BackgroundTransparency = 0.5
PlrInfo.BorderColor3 = Color3.new(0,0,0)
PlrInfo.BorderSizePixel = 0
PlrInfo.Position = UDim2.new(1.321107276908151e-07,0,0,0)
PlrInfo.Size = UDim2.new(1,0,0.12953367829322815,0)
PlrInfo.Name = "PlrInfo"
PlrInfo.Parent = LeftSide
local UICorner7 = Instance.new("UICorner")
UICorner7.Parent = PlrInfo
local Namee = Instance.new("TextLabel")
Namee.FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json",Enum.FontWeight.Regular,Enum.FontStyle.Normal)
Namee.TextColor3 = Color3.new(1,1,1)
Namee.TextScaled = true
Namee.TextSize = 14
Namee.TextWrapped = true
Namee.Text = player.Name
Namee.BackgroundColor3 = Color3.new(1,1,1)
Namee.BackgroundTransparency = 1
Namee.BorderColor3 = Color3.new(0,0,0)
Namee.BorderSizePixel = 0
Namee.Position = UDim2.new(0.3333333432674408,0,0,0)
Namee.Size = UDim2.new(0.6666666865348816,0,1,0)
Namee.Name = "Namee"
Namee.Parent = PlrInfo
local UIStroke1 = Instance.new("UIStroke")
UIStroke1.Parent = Namee
local Pic = Instance.new("ImageLabel")
Pic.Image = game:GetService("Players"):GetUserThumbnailAsync(player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size180x180)
Pic.BackgroundColor3 = Color3.new(1,1,1)
Pic.BackgroundTransparency = 1
Pic.BorderColor3 = Color3.new(0,0,0)
Pic.BorderSizePixel = 0
Pic.Position = UDim2.new(0.051948051899671555,0,0,0)
Pic.Size = UDim2.new(0.21645021438598633,0,1,0)
Pic.Name = "Pic"
Pic.Parent = PlrInfo
local UICorner8 = Instance.new("UICorner")
UICorner8.CornerRadius = UDim.new(1,8)
UICorner8.Parent = Pic
local List = Instance.new("ScrollingFrame")
List.ScrollBarImageColor3 = Color3.new(0,0,0)
List.Active = true
List.BackgroundColor3 = Color3.new(1,1,1)
List.BackgroundTransparency = 1
List.BorderColor3 = Color3.new(0,0,0)
List.BorderSizePixel = 0
List.Position = UDim2.new(0,0,0.17357513308525085,0)
List.Size = UDim2.new(1.004328966140747,0,0.696891188621521,0)
List.Name = "List"
List.Parent = LeftSide
	for i, v in pairs(sections) do
		local ExampleButton = Instance.new("TextButton")
		ExampleButton.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
		ExampleButton.Text = v.name or "Section " .. i
		ExampleButton.TextColor3 = Color3.new(0, 0, 0)
		ExampleButton.TextScaled = true
		ExampleButton.TextSize = 14
		ExampleButton.TextWrapped = true
		ExampleButton.BackgroundColor3 = Color3.new(1, 1, 1)
		ExampleButton.BackgroundTransparency = 0.2
		ExampleButton.BorderColor3 = Color3.new(1, 1, 1)
		ExampleButton.BorderSizePixel = 0
		ExampleButton.Size = UDim2.new(0.892, 0, 0.185, 0)
		ExampleButton.Name = "Button_" .. i
		ExampleButton.Parent = List

		ExampleButton.MouseButton1Click:Connect(function()
			local player = game.Players.LocalPlayer
			lib:CreateButtonsForSection(player, i)
		end)
		local UICorner9 = Instance.new("UICorner")
		UICorner9.Parent = ExampleButton
	end
local UIListLayout1 = Instance.new("UIListLayout")
UIListLayout1.Padding = UDim.new(0,3)
UIListLayout1.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout1.Parent = List
local TextLabel = Instance.new("TextLabel")
TextLabel.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json",Enum.FontWeight.Regular,Enum.FontStyle.Normal)
TextLabel.Text = "UI Library By @Oflice2"
TextLabel.TextColor3 = Color3.new(0,0,0)
TextLabel.TextScaled = true
TextLabel.TextSize = 14
TextLabel.TextWrapped = true
TextLabel.BackgroundColor3 = Color3.new(1,1,1)
TextLabel.BackgroundTransparency = 1
TextLabel.BorderColor3 = Color3.new(0,0,0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0,0,0.8704662919044495,0)
TextLabel.Size = UDim2.new(0.9567099809646606,0,0.12953367829322815,0)
TextLabel.Parent = LeftSide
local shadowHolder = Instance.new("Frame")
shadowHolder.BackgroundTransparency = 1
shadowHolder.Size = UDim2.new(1,0,1,0)
shadowHolder.ZIndex = 0
shadowHolder.Name = "shadowHolder"
shadowHolder.Parent = AetherUI_Frame
local umbraShadow = Instance.new("ImageLabel")
umbraShadow.Image = "rbxassetid://1316045217"
umbraShadow.ImageColor3 = Color3.new(0,0,0)
umbraShadow.ImageTransparency = 0.8600000143051147
umbraShadow.ScaleType = Enum.ScaleType.Slice
umbraShadow.SliceCenter = Rect.new(10,10,118,118)
umbraShadow.AnchorPoint = Vector2.new(0.5,0.5)
umbraShadow.BackgroundTransparency = 1
umbraShadow.Position = UDim2.new(0.5,0,0.5310880541801453,0)
umbraShadow.Size = UDim2.new(1.0293610095977783,0,1.044041395187378,0)
umbraShadow.ZIndex = 0
umbraShadow.Name = "umbraShadow"
umbraShadow.Parent = shadowHolder
local penumbraShadow = Instance.new("ImageLabel")
penumbraShadow.Image = "rbxassetid://1316045217"
penumbraShadow.ImageColor3 = Color3.new(0,0,0)
penumbraShadow.ImageTransparency = 0.8799999952316284
penumbraShadow.ScaleType = Enum.ScaleType.Slice
penumbraShadow.SliceCenter = Rect.new(10,10,118,118)
penumbraShadow.AnchorPoint = Vector2.new(0.5,0.5)
penumbraShadow.BackgroundTransparency = 1
penumbraShadow.Position = UDim2.new(0.5,0,0.5310880541801453,0)
penumbraShadow.Size = UDim2.new(1.0293610095977783,0,1.044041395187378,0)
penumbraShadow.ZIndex = 0
penumbraShadow.Name = "penumbraShadow"
penumbraShadow.Parent = shadowHolder
local ambientShadow = Instance.new("ImageLabel")
ambientShadow.Image = "rbxassetid://1316045217"
ambientShadow.ImageColor3 = Color3.new(0,0,0)
ambientShadow.ImageTransparency = 0.8799999952316284
ambientShadow.ScaleType = Enum.ScaleType.Slice
ambientShadow.SliceCenter = Rect.new(10,10,118,118)
ambientShadow.AnchorPoint = Vector2.new(0.5,0.5)
ambientShadow.BackgroundTransparency = 1
ambientShadow.Position = UDim2.new(0.5,0,0.5310880541801453,0)
ambientShadow.Size = UDim2.new(1.0293610095977783,0,1.044041395187378,0)
ambientShadow.ZIndex = 0
ambientShadow.Name = "ambientShadow"
ambientShadow.Parent = shadowHolder
end

local UserInputService = game:GetService("UserInputService")

local function onInputBegan(input, isProcessed)
	if isProcessed then
		return 
	end

	if input.KeyCode == Enum.KeyCode.RightShift then
		AetherUI.Enabled = not AetherUI.Enabled
	end
end

UserInputService.InputBegan:Connect(onInputBegan)

return lib
