-- ахтунг, кринге

local function setGroup(ply, group)

	-- тебе нужна библиотека SGRF, для проверки пользователя на присутствие в твоей стим группе, но если хочешь раскомментируй этот кусок кода и удали дальнейший

	-- ULib.ucl.addUser( ply:SteamID(), nil, nil, role )

	if aga == SGRF.IsPlayerInGroup(ply) then
		ULib.ucl.addUser( ply:SteamID(), nil, nil, role )
		ply:ChatPrint("Вам выдана роль. Приятной игры!")
	else
		ply:ChatPrint("Вам нужно присоединиться к нашей группе в Стиме. (!sg в чат)")
	end
end
 
hook.Add( "PlayerSay", "claim", function( sender, text )
	if text == "!claim" or text == "/claim" then
		local Frame = vgui.Create( "DFrame" )
		Frame:SetTitle( "Выбери свою роль" )
		Frame:SetSize( 300,320 )
		Frame:Center()			
		Frame:MakePopup()
		Frame.Paint = function( self, w, h )
			draw.RoundedBox( 0, 0, 0, w, h, Color( 231, 76, 60, 150 ) )
		end

		local Button = vgui.Create("DButton", Frame)
		Button:SetText( "Стать строителем" )
		Button:SetTextColor( Color(255,255,255) )
		Button:SetPos( 0, 20 )
		Button:SetSize( 300, 150 )
		Button.Paint = function( self, w, h )
			draw.RoundedBox( 0, 0, 0, w, h, Color( 0, 100, 255 ) )
		end

		Button.DoClick = function()
			Frame:Close()
			setGroup(ply, "builder")
		end

		local Button1 = vgui.Create("DButton", Frame)
		Button1:SetText( "Стать штурмовиком" )
		Button1:SetTextColor( Color(255,255,255) )
		Button1:SetPos( 0, 170 )
		Button1:SetSize( 300, 150 )
		Button1.Paint = function( self, w, h )
			draw.RoundedBox( 0, 0, 0, w, h, Color( 255, 100, 100 ) )
		end

		Button1.DoClick = function()
			Frame:Close()
			setGroup(ply, "pvp")
		end
		return ""
	end
end)
