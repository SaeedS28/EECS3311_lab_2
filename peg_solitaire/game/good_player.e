note
	description: "A good player who knows how to win certain solitaire games."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	GOOD_PLAYER

inherit
	PLAYER

create
	make

feature -- Commands
	wins_easy_board
			-- Win a cross board.
		require
			current_game_is_easy:
				game.board.out~game.bta.templates.easy_board.out
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

			game.move_down (2, 4)
			assertion := game.out ~ "[
			Game is over: No
			Game is won : No
			Board Status:
			***.***
			***.***
			***.***
			***O***
			***O***
			***.***
			*******
			]"
			check assertion end

			game.move_down (4, 4)
			assertion := game.out ~ "[
			Game is over: Yes
			Game is won : Yes
			Board Status:
			***.***
			***.***
			***.***
			***.***
			***.***
			***O***
			*******
			]"
			check assertion end
		ensure
			finished_and_won_game:
				game.is_over and game.is_won
		end

	wins_cross_board
			-- Win a cross board.
		require
			current_game_is_cross:
				current.game.board ~ templates.cross_board

		local
			assertion: BOOLEAN
		do

		ensure
			finished_and_won_game:
				game.is_over and game.is_won
		end

	wins_plus_board
			-- Win a plus board.
		require
			current_game_is_plus:
				game.board.out~game.bta.templates.plus_board.out
		local
			assertion: BOOLEAN
		do

		ensure
			finished_and_won_game:
				game.is_over and game.is_won
		end
end
