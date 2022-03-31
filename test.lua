surface.CreateFont("font1", {
	font = "ChatFont", 
	size = 20, 
	weight = 674, 
	antialias = false, 
	outline  = true, 
})
local function MsgY(time, text)
	if not windowopen then
		windowopen = true
		local window = vgui.Create("DFrame")
		window:SetPos(ScrW()/2.7, 0)
		window:SetSize(500, 30)
		window:SlideDown(1) --0.3
		window:SetTitle("")
		window:ShowCloseButton(false)
		window:SetDraggable(false)
		window.Paint = function(s, w, h)
			surface.SetDrawColor(50, 50, 50, 255)
			surface.DrawRect(0, 0, w, h)
			draw.DrawText(text, "font1", w/2, 6, Color(0, 150, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		end
		timer.Simple(time, function()
			if windowopen then
				window:SlideUp(1)
				timer.Simple(1, function()
					windowopen = false
					window:Remove()
				end)
			end
		end)
	end
	print("\n"..text.."\n")
end

MsgY(1.4, "Loaded!")
chat.AddText(Color(0, 150, 255), "Successful load")
surface.PlaySound("buttons/bell1.wav")
