-- ахтунг, кринге
util.AddNetworkString( "Claim" )

net.Receive("Claim", function(len, ply)

	group = nil
	local group = net.ReadBool() -- бул, потому что безопаснее

	if not ply:IsValid() then return end -- если чел резко ливнул, или баг

	-- тебе нужна библиотека SGRF, для проверки пользователя на присутствие в твоей стим группе

	if SGRF.IsPlayerInGroup(ply) then
		if group == false then
			ply:ChatPrint("Вам выдана роль Строителя. Приятной игры!")
			ULib.ucl.addUser( ply:SteamID(), nil, nil, "builder" )
		else
			ply:ChatPrint("Вам выдана роль Штуромвика. Приятной игры!")
			ULib.ucl.addUser( ply:SteamID(), nil, nil, "pvp" )
		end
	else
		ply:ChatPrint("Вам нужно присоединиться к нашей группе в Стиме. (!sg в чат)")
	end

end)
 
hook.Add( "PlayerSay", "claim", function( sender, text )
	if text == "!claim" or text == "/claim" then
		net.Start( "Claim" )
        	net.Send(sender)
	end
end)
