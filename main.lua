function love.load()

	width = 600
	height = 600

	love.window.setMode(width, height, {resizable = false, vsync = false, msaa = 100, fullscreen = false})
	love.window.setTitle("Tic Tac Toe")
	love.graphics.setBackgroundColor(1, 1, 1)
    
    map = {}
    for i = 1, 3 do
    	map[i] = {}
    	for j = 1, 3 do
 		map[i][j] = nil
    	end
    end

    winner = nil

    player = {}
    player.symbol = 1

end


function love.update(ds)

	mousex = love.mouse.getX()
	mousey = love.mouse.getY()
	mousepressed = love.mouse.isDown(1)

	if mousex > 75 and mousey > 75 and mousex < 525 and mousey < 525 and mousepressed and winner == nil then

		if mousex <= 225 then

			if mousey <= 225 and map[1][1] == nil then 
				map[1][1] = player.symbol 
				if player.symbol == 1 then player.symbol = 2 else player.symbol = 1 end
			end
			if mousey > 225 and mousey <= 375 and map[1][2] == nil then 
				map[1][2] = player.symbol 
				if player.symbol == 1 then player.symbol = 2 else player.symbol = 1 end
			end
			if mousey > 375 and mousey <= 525 and map[1][3] == nil then 
				map[1][3] = player.symbol 
			if player.symbol == 1 then player.symbol = 2 else player.symbol = 1 end
			end

		elseif mousex <= 375 then

			if mousey <= 225 and map[2][1] == nil then 
				map[2][1] = player.symbol 
				if player.symbol == 1 then player.symbol = 2 else player.symbol = 1 end 
			end
			if mousey > 225 and mousey <= 375 and map[2][2] == nil then 
				map[2][2] = player.symbol 
				if player.symbol == 1 then player.symbol = 2 else player.symbol = 1 end 
			end
			if mousey > 375 and mousey <= 525 and map[2][3] == nil then 
				map[2][3] = player.symbol 
				if player.symbol == 1 then player.symbol = 2 else player.symbol = 1 end 
			end

		elseif mousex <= 525 then

			if mousey <= 225 and map[3][1] == nil then 
				map[3][1] = player.symbol 
				if player.symbol == 1 then player.symbol = 2 else player.symbol = 1 end
			end
			if mousey > 225 and mousey <= 375 and map[3][2] == nil then 
				map[3][2] = player.symbol 
				if player.symbol == 1 then player.symbol = 2 else player.symbol = 1 end
		end
			if mousey > 375 and mousey <= 525 and map[3][3] == nil then 
				map[3][3] = player.symbol 
				if player.symbol == 1 then player.symbol = 2 else player.symbol = 1 end
			end

		end

	end

	if player.symbol == 1 then command = "Player 1's turn [O]" elseif player.symbol == 2 then command = "Player 2's turn [X]" end

	if map[1][1] == map[1][2] and map[1][2] == map[1][3] and map[1][1] ~= 0 then
		winner = map[1][1]
	elseif map[2][1] == map[2][2] and map[2][2] == map[2][3] and map[2][1] ~= 0 then
		winner = map[2][1]
	elseif map[3][1] == map[3][2] and map[3][2] == map[3][3] and map[3][1] ~= 0 then
		winner = map[3][1]
	elseif map[1][1] == map[2][1] and map[2][1] == map[3][1] and map[1][1] ~= 0 then
		winner = map[1][1]
	elseif map[1][2] == map[2][2] and map[2][2] == map[3][2] and map[1][2] ~= 0 then
		winner = map[1][2]
	elseif map[1][3] == map[2][3] and map[2][3] == map[3][3] and map[1][3] ~= 0 then
		winner = map[1][3]
	elseif map[1][1] == map[2][2] and map[2][2] == map[3][3] and map[1][1] ~= 0 then
		winner = map[1][1]
	elseif map[1][3] == map[2][2] and map[2][2] == map[3][1] and map[1][3] ~= 0 then
		winner = map[1][3]
	else 
		emptyslots = 0
		for x = 1, 3 do
			for y = 1, 3 do
				if map[x][y] == nil then emptyslots = emptyslots + 1 end
			end
		end
	end

	if winner == 1 then
		command = "Player 1 Won."
	elseif winner == 2 then
		command = "Player 2 Won."
	elseif emptyslots == 0 then
		command = "Tie."
	end

end

function love.draw()


	love.graphics.setColor(0, 0, 0)
	love.graphics.print(command, 20, 20)

	love.graphics.line(75, 225, 525, 225)
	love.graphics.line(75, 375, 525, 375)


	love.graphics.line(225, 75, 225, 525)
	love.graphics.line(375, 75, 375, 525)

	--love.graphics.setColor(0, 0, 1)
	--love.graphics.rectangle("line", 75, 75, 450, 450)

	for x = 1, 3 do
		for y = 1, 3 do
			if map[x][y] == 1 then
				love.graphics.setColor(0, 0, 1)
				love.graphics.circle("line", (x * 150), (y * 150), 60)
			elseif map[x][y] == 2 then
				love.graphics.setColor(1, 0, 0)
				love.graphics.line(85 + (x - 1) * 150, 85 + (y - 1) * 150, 65 + x * 150, 65 + y * 150)
				love.graphics.line(85 + (x - 1) * 150, 65 + y * 150, 65 + x * 150, 85 + (y - 1) * 150)
			end
		end
	end
end
