local Rojo = script:FindFirstAncestor("Rojo")
local Plugin = Rojo.Plugin

local Roact = require(Rojo.Roact)

local Assets = require(Plugin.Assets)

local e = Roact.createElement

local RoundBox = Assets.Slices.RoundBox

local function FormTextInput(props)
	local value = props.value
	local onValueChange = props.onValueChange
	local layoutOrder = props.layoutOrder
	local size = props.size

	return e("ImageLabel", {
		LayoutOrder = layoutOrder,
		Image = RoundBox.asset,
		ImageRectOffset = RoundBox.offset,
		ImageRectSize = RoundBox.size,
		ScaleType = Enum.ScaleType.Slice,
		SliceCenter = RoundBox.center,
		ImageColor3 = Color3.new(0.95, 0.95, 0.95),
		Size = size,
		BackgroundTransparency = 1,
	}, {
		InputInner = e("TextBox", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, -12, 1, -12),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Font = Enum.Font.SourceSans,
			ClearTextOnFocus = false,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextSize = 20,
			Text = value,
			TextColor3 = Color3.new(0.05, 0.05, 0.05),

			[Roact.Change.Text] = function(rbx)
				onValueChange(rbx.Text)
			end,
		}),
	})
end

return FormTextInput