-- ахтунг кринге x2

net.Receive("Claim", function(len, ply)

		ply = nil
		ply = net.ReadEntity()

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
			net.Start( "Claim" )
				net.WriteBool(false)
			net.SendToServer()
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
			net.Start( "Claim" )
				net.WriteBool(true)
			net.SendToServer()
		end

end)
