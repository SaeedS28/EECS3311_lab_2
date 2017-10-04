note
	description: "A game of peg solitaire."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	GAME

inherit
	ANY
		redefine
			out
		end

create
	make_from_board,
	make_easy,
	make_cross,
	make_plus,
	make_pyramid,
	make_arrow,
	make_diamond,
	make_skull

feature -- Constructors
	make_from_board (new_board: BOARD)
			-- Initialize a game with 'new_board'.
		do
			board := new_board
		ensure
			board_set: True
				-- Your task.
		end

	make_easy
			-- Initialize a game with easy board.
		do
			create board.make_easy
		ensure
			board_set:
				board ~ bta.templates.easy_board
		end

	make_cross
			-- Initialize a game with Cross board.
		do
			make_easy
			-- Your task: the current implementation
			-- may not be correct.
		ensure
			board_set: True
				-- Your task.
		end

	make_plus
			-- Initialize a game with Plus board.
		do
			make_easy
			-- Your task: the current implementation
			-- may not be correct.
		ensure
			board_set: True
				-- Your task.
		end

	make_pyramid
			-- Initialize a game with Pyramid board.
		do
			make_easy
			-- Your task: the current implementation
			-- may not be correct.
		ensure
			board_set: True
				-- Your task.
		end

	make_arrow
			-- Initialize a game with Arrow board.
		do
			make_easy
			-- Your task: the current implementation
			-- may not be correct.
		ensure
			board_set: True
				-- Your task.
		end

	make_diamond
			-- Initialize a game with Diamond board.
		do
			make_easy
			-- Your task: the current implementation
			-- may not be correct.
		ensure
			board_set: True
				-- Your task.
		end

	make_skull
			-- Initialize a game with Skull board.
		do
			make_easy
			-- Your task: the current implementation
			-- may not be correct.
		ensure
			board_set: True
				-- Your task.
		end

feature -- Commands
	move_left (r, c: INTEGER)
		require
			from_slot_valid_row: True
				-- Your task.
			from_slot_valid_column: True
				-- Your task.
			middle_slot_valid_column: True
				-- Your task.
			to_slot_valid_column: True
				-- Your task.
			from_slot_occupied: True
				-- Your task.
			middle_slot_occupied: True
				-- Your task.
			to_slot_unoccupied: True
				-- Your task.
		do
			-- Your task.
		ensure
			slots_properly_set: True
				-- Your task.
			other_slots_unchanged: True
				-- Your task.
				-- Hint: Use 'matches_slots_except' feature from BOARD.
		end

	move_right (r, c: INTEGER)
		require
			from_slot_valid_row: True
				-- Your task.
			from_slot_valid_column: True
				-- Your task.
			middle_slot_valid_column: True
				-- Your task.
			to_slot_valid_column: True
				-- Your task.
			from_slot_occupied: True
				-- Your task.
			middle_slot_occupied: True
				-- Your task.
			to_slot_unoccupied: True
				-- Your task.
		do
			-- Your task.
		ensure
			slots_properly_set: True
				-- Your task.
			other_slots_unchanged: True
				-- Your task.
				-- Hint: Use 'matches_slots_except' from BOARD.
		end

	move_up (r, c: INTEGER)
		require
			from_slot_valid_column: True
				-- Your task.
			from_slot_valid_row: True
				-- Your task.
			middle_slot_valid_row: True
				-- Your task.
			to_slot_valid_row: True
				-- Your task.
			from_slot_occupied: True
				-- Your task.
			middle_slot_occupied: True
				-- Your task.
			to_slot_unoccupied: True
				-- Your task.
		do
			-- Your task.
		ensure
			slots_properly_set: True
				-- Your task.
			other_slots_unchanged: True
				-- Your task.
				-- Hint: Use 'matches_slots_except' from BOARD.
		end

	move_down (r, c: INTEGER)
		require
			from_slot_valid_column: True
				-- Your task.
			from_slot_valid_row: True
				-- Your task.
			middle_slot_valid_row: True
				-- Your task.
			to_slot_valid_row: True
				-- Your task.
			from_slot_occupied: True
				-- Your task.
			middle_slot_occupied: True
				-- Your task.
			to_slot_unoccupied: True
				-- Your task.
		do
			-- Your task.
		ensure
			slots_properly_set: True
				-- Your task.
			other_slots_unchanged: True
				-- Your task.
				-- Hint: Use 'matches_slots_except' from BOARD.
		end

feature -- Status Queries
	is_over: BOOLEAN
			-- Is the current game 'over'?
			-- i.e., no further movements are possible.
		do
			-- Your task.
		ensure
			correct_result: True
				-- Your task.
				-- Hint: write two nested across expressions to
				-- iterate through all slots. Each slot is identified
				-- by its row and column numbers. If there is any
				-- slot that is movable, then the result should be true.
		end

	is_won: BOOLEAN
			-- Has the current game been won?
			-- i.e., there's only one occupied slot on the board.
		do
			-- Your task.
		ensure
			game_won_iff_one_occupied_slot_left: True
				-- Your task.
				-- Hint: Use 'number_of_occupied_slots' from BOARD.
			winning_a_game_means_game_over:
				-- Your task.
		end

feature -- Output
	out: STRING
			-- String representation of current game.
			-- Do not modify this feature!
		do
			create Result.make_empty
			Result.append ("Game is over: " + boolean_to_yes_no (is_over) + "%N")
			Result.append ("Game is won : " + boolean_to_yes_no (is_won) + "%N")
			Result.append ("Board Status:%N")
			Result.append (board.out)
		end

feature -- Auxiliary Routines
	boolean_to_yes_no (b: BOOLEAN): STRING
			-- 'Yes' or 'No' corresponding to 'b'.
		do
			if b then
				Result := "Yes"
			else
				Result := "No"
			end
		end

feature -- Board
	bta: BOARD_TEMPLATES_ACCESS
	board: BOARD
end
