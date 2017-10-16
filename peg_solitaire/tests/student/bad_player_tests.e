note
	description: "Tests on good players."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	BAD_PLAYER_TESTS

inherit
	ES_TEST

create
	make

feature {NONE}
	bta:BOARD_TEMPLATES_ACCESS

feature -- Constructor
	make
		do
			add_boolean_case (agent test_loss_pyramid_board)
			add_boolean_case (agent test_loss_arrow)
			add_boolean_case (agent test_loss_diamond)
		end

feature -- Tests
	test_loss_pyramid_board: BOOLEAN
		local
			g: GAME
		do
			comment ("test:plus board won and over")
			create g.make_pyramid

			Result :=
				g.board ~ bta.templates.pyramid_board
				and not g.is_over
				and not g.is_won
				check Result end

				g.move_up (4, 5)
				g.move_left (2, 5)
				g.move_up (4, 4)
				g.move_right (2, 3)
				g.move_up (4, 3)
				g.move_up (5, 2)
				g.move_up (5, 6)
				g.move_left (5, 4)
				g.move_right (5, 1)
				Result :=
		 		g.is_over and not(g.is_won)
				check Result end

	end

	test_loss_arrow: BOOLEAN
	local
			player: BAD_PLAYER
		do
			comment ("test: bad player loses an arrow board")
			create player.make

			player.game.make_arrow
			player.loses_arrow_game
			Result :=
					player.game.is_over
				and not player.game.is_won
			check Result end
		end


	test_loss_diamond: BOOLEAN
	local
			player: BAD_PLAYER
		do
			comment ("test: bad player loses a diamond board")
			create player.make

			player.game.make_diamond
			player.loses_diamond_game
			Result :=
					player.game.is_over
				and not player.game.is_won
			check Result end
		end
	end
