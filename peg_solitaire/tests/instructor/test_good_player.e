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
			add_boolean_case (agent test_board_out)
			add_violation_case_with_tag ("correct_result", agent test_bad_matches_slots_except_postcondition)
			add_violation_case_with_tag ("valid_row_range", agent test_correct_matches_slot_except_precondition)
			add_boolean_case (agent test_correct_matches_slots_except)
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

		skull.game.make_skull
		Result:= skull.game.board.out ~ skull.game.bta.templates.skull_board_out
		check Result end
	end

test_bad_matches_slots_except_postcondition
	local
		board: BOARD
    	board2: BAD_MATCHES_SLOT_EXCEPT
    	test: BOOLEAN
    do
    	comment ("test: matches_slots_except postcondition violation")
    	create board.make_diamond
    	create board2.make
    	test:=  board2.matches_slots_except (board, 1, 2, 3, 4)
    end

test_correct_matches_slot_except_precondition
	local
		board:BOARD
		test: BOOLEAN
	do
		comment ("test: matches_slots_except_precondition for valid_row_range")
		create board.make_diamond
		test:= board.matches_slots_except (board, 6, 5, 2, 3)
	end

test_correct_matches_slots_except :BOOLEAN
	local
		board1,board2:BOARD
	do
		comment ("test: correct run for the matches_slots_except")
		create board1.make_arrow
		create board2.make_arrow

		board1.set_statuses (4, 4, 2, 3, board1.unavailable_slot)
		result:= board1.matches_slots_except (board2, 4, 4, 2, 3)
		check result end
	end

end
