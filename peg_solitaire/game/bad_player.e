note
	description: "A bad player who loses many solitaire games."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	BAD_PLAYER

inherit
	PLAYER

create
	make

feature -- Commands
	loses_easy_board
			-- Lose a cross board.
		require
			current_game_is_easy:
				game.board.out~templates.easy_board.out
		local
			assertion: BOOLEAN
		do
			assertion := game.out ~ "[
			Game is over: No
			Game is won : No
			Board Status:
			***.***
			***O***
			***O***
			***.***
			***O***
			***.***
			*******
			]"
			check assertion end

			game.move_up (3, 4)
			assertion := game.out ~ "[
			Game is over: Yes
			Game is won : No
			Board Status:
			***O***
			***.***
			***.***
			***.***
			***O***
			***.***
			*******
			]"
			check assertion end
		ensure
			finished_and_lost_game:
				game.is_over and not (game.is_won)
		end

	loses_pyramid_game
		require
			current_game_is_pyramid:
				game.board.out~templates.pyramid_board.out
		local
			assertion: BOOLEAN
		do

		ensure
			finished_and_lost_game:
				game.is_over and not(game.is_won)
		end

	loses_arrow_game
		require
			current_game_is_arrow:
				game.board.out~templates.arrow_board.out
		local
			assertion: BOOLEAN
		do

		ensure
			finished_and_lost_game:
				game.is_over and not(game.is_won)
		end

	loses_diamond_game
		require
			current_game_is_diamond:
				game.board.out~templates.diamond_board.out
		local
			assertion: BOOLEAN
		do

			check assertion end
		ensure
			finished_and_lost_game:
				game.is_over and not(game.is_won)
		end

	loses_skull_game
		require
			current_game_is_skull:
				game.board.out~templates.skull_board.out
		local
			assertion: BOOLEAN
		do

		ensure
			finished_and_lost_game:
				game.is_over and not(game.is_won)
		end
end
