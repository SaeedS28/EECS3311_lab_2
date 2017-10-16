note
	description: "Tests on good players."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	GOOD_PLAYER_TESTS

inherit
	ES_TEST

create
	make

feature {NONE}
	bta:BOARD_TEMPLATES_ACCESS
feature -- Constructor
	make
		do
			add_boolean_case (agent test_game_won_plus_board)
			add_boolean_case (agent test_board_out)
			add_violation_case_with_tag ("middle_slot_occupied",  agent test_move_left_precondition)
		end

feature -- Tests
	test_game_won_plus_board: BOOLEAN
		local
			g: GAME
		do
			comment ("test: plus board won and over")
			create g.make_plus

			Result :=
				g.board ~ bta.templates.plus_board
				and not g.is_over
				and not g.is_won
				check Result end

				g.move_left (4,3)
				g.move_left(4,5)
				g.move_up (6, 4)
				g.move_left (4, 4)
				g.move_right (4, 1)
				g.move_down (2,4)
				g.move_right (4, 3)
				g.move_left (4,6)
				Result :=
		 		g.is_over and g.is_won
				check Result end
		end

test_board_out: BOOLEAN
		local
			cross,arrow,plus,diamond,pyramid,skull: GOOD_PLAYER
		do
			comment ("test: tests the initialization of different boards using the out feature")

			create cross.make
			create arrow.make
			create diamond.make
			create pyramid.make
			create skull.make
			create plus.make

			cross.game.make_cross
			Result:= cross.game.board.out ~ cross.game.bta.templates.cross_board_out
			check Result end

			plus.game.make_plus
			Result:= plus.game.board.out ~ plus.game.bta.templates.plus_board_out
			check Result end

			arrow.game.make_arrow
			Result:= arrow.game.board.out ~ arrow.game.bta.templates.arrow_board_out
			check Result end

			diamond.game.make_diamond
			Result:= diamond.game.board.out ~ arrow.game.bta.templates.diamond_board_out
			check Result end

			pyramid.game.make_pyramid
			Result:= pyramid.game.board.out ~ pyramid.game.bta.templates.pyramid_board_out
			check Result end
--**OOO**
--**OOO**
--.OOOOO.
--.O.O.O.
--.......
--**OOO**
--**OOO**
			skull.game.make_skull
			Result:= skull.game.board.out ~ skull.game.bta.templates.skull_board_out
			check Result end
		end

test_move_left_precondition
		local
			g: GAME
		do
			comment ("test: move_left precondition violation")
			create g.make_plus
			g.move_left (4,3)
			g.move_left(4,5)
			g.move_left (6, 4)
--				g.move_up (6, 4)
--				g.move_left (4, 4)
--				g.move_right (4, 1)
--				g.move_down (2,4)
--				g.move_right (4, 3)
--				g.move_left (4,6)
--				Result :=
--		 		g.is_over and g.is_won
--				check Result end
		end


end
