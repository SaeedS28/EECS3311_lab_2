note
	description: "Tests on good players."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	TEST_GOOD_PLAYER

inherit
	ES_TEST

create
	make

feature -- Constructor
	make
		do
			add_boolean_case (agent test_good_player_wins_easy_board)
		end

feature -- Tests
	test_good_player_wins_easy_board: BOOLEAN
		local
			player: GOOD_PLAYER
		do
			comment ("test: good player wins an easy board")
			create player.make

			player.game.make_easy
			player.wins_easy_board
			Result :=
					player.game.is_over
				and player.game.is_won
			check Result end
		end
end


test_game_won_cross_board: BOOLEAN
			local
				g: GAME
			do
				comment ("test: game won and over condition plus board")
				create g.make_plus

				Result :=
						g.board ~ bta.templates.plus_board
						and not g.is_over
						and not g.is_won
						check Result end

						g.move_up (3, 4)
						g.move_up (5, 4)
						g.move_right(4, 2)
						g.move_up (4, 4)
						g.move_left (4, 6)
						g.move_down (1, 4)
						g.move_down (3, 4)
						g.move_up (6, 4)

						Result :=
				 		g.is_over and g.is_won
						check Result end

			end
