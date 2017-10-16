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
			board_set:
				board.out~new_board.out
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
			create board.make_cross
		ensure
			board_set:
				board.out~bta.templates.cross_board.out
		end

	make_plus
			-- Initialize a game with Plus board.
		do
			create board.make_plus
		ensure
			board_set:
				board.out~bta.templates.plus_board.out
		end

	make_pyramid
			-- Initialize a game with Pyramid board.
		do
			create board.make_pyramid
		ensure
			board_set:
				board.out~bta.templates.pyramid_board.out
		end

	make_arrow
			-- Initialize a game with Arrow board.
		do
			create board.make_arrow
		ensure
			board_set:
				board.out~bta.templates.arrow_board.out
		end

	make_diamond
			-- Initialize a game with Diamond board.
		do
			create board.make_diamond
		ensure
			board_set:
				board.out~bta.templates.diamond_board.out
		end

	make_skull
			-- Initialize a game with Skull board.
		do
			create board.make_skull
		ensure
			board_set:
				board.out~bta.templates.skull_board.out
		end

feature -- Commands
	move_left (r, c: INTEGER)
		require
			from_slot_valid_row:
				board.is_valid_row (r)
			from_slot_valid_column:
				c > 2 and c <= 7
			middle_slot_valid_column:
				c - 1 >1 and c - 1 < 7
			to_slot_valid_column:
				c - 2 >= 1 and c - 2 < 6
			from_slot_occupied:
				board.status_of (r, c) ~ board.occupied_slot
			middle_slot_occupied: board.status_of
				(r, c - 1) ~ board.occupied_slot
			to_slot_unoccupied:
				board.status_of (r, c - 2) ~ board.unoccupied_slot
		do
			board.set_status (r, c, board.unoccupied_slot)
			board.set_status (r, c - 1, board.unoccupied_slot)
			board.set_status (r, c - 2, board.occupied_slot)
		ensure
			slots_properly_set:
				board.status_of (r, c) ~ board.unoccupied_slot
				and board.status_of (r, c - 1) ~ board.unoccupied_slot
				and board.status_of (r, c - 2) ~ board.occupied_slot
			other_slots_unchanged:
				board.matches_slots_except (board, r, r, c, c - 2)
end


	move_right (r, c: INTEGER)
		require
			from_slot_valid_row:
				board.is_valid_row (r)
			from_slot_valid_column:
				c >= 1 and c <6
			middle_slot_valid_column:
				c + 1 >= 2 and c + 1 <7
			to_slot_valid_column:
				c + 2 >2 and c + 2 <= 7
			from_slot_occupied: board.status_of (r, c) ~ board.occupied_slot
			middle_slot_occupied: board.status_of (r, c + 1) ~ board.occupied_slot
			to_slot_unoccupied: board.status_of (r, c + 2) ~ board.unoccupied_slot
		do
			board.set_status (r, c, board.unoccupied_slot)
			board.set_status (r, c + 1, board.unoccupied_slot)
			board.set_status (r, c + 2, board.occupied_slot)
		ensure
			slots_properly_set:
				board.status_of (r, c) ~ board.unoccupied_slot
				and board.status_of (r, c + 1) ~ board.unoccupied_slot
				and board.status_of (r, c + 2) ~ board.occupied_slot
			other_slots_unchanged:
				board.matches_slots_except (board, r, r, c, c + 2)
end

	move_up (r, c: INTEGER)
		require
			from_slot_valid_column:
				board.is_valid_column (c)
			from_slot_valid_row:
				r >2 and r <= 7
			middle_slot_valid_row:
				r - 1 >=2 and r-1 <7
			to_slot_valid_row:
				r - 2 >= 1 and r-2 < 6
			from_slot_occupied:
				board.status_of (r, c) ~ board.occupied_slot
			middle_slot_occupied:
				board.status_of (r - 1, c) ~ board.occupied_slot
			to_slot_unoccupied:
				board.status_of (r - 2, c) ~ board.unoccupied_slot
		do
			board.set_status (r - 2,c,board.occupied_slot)
			board.set_statuses (r - 1, r,c,c,board.unoccupied_slot)
		ensure
			slots_properly_set:
				board.status_of (r, c)~board.unoccupied_slot
				and board.status_of (r - 1, c)~board.unoccupied_slot
				and board.status_of (r - 2, c)~board.occupied_slot
			other_slots_unchanged:
				board.matches_slots_except (board, r-2, r, c, c)
		end

	move_down (r, c: INTEGER)
		require
			from_slot_valid_column:
				board.is_valid_column (c)
			from_slot_valid_row:
				r >= 1 and r <6
			middle_slot_valid_row:
				r + 1 >= 2 and r + 1 <7
			to_slot_valid_row:
				r + 2 >2 and r + 2 <= 7
			from_slot_occupied:
				board.status_of (r, c)~board.occupied_slot
			middle_slot_occupied:
				board.status_of (r+1, c)~board.occupied_slot
			to_slot_unoccupied:
				board.status_of (r+2, c)~board.unoccupied_slot
		do
			board.set_status (r+2,c,board.occupied_slot)
			board.set_statuses (r, r+1, c, c, board.unoccupied_slot)
		ensure
			slots_properly_set:
				board.status_of (r, c)~ board.unoccupied_slot
				and board.status_of (r+1, c)~ board.unoccupied_slot
				and board.status_of (r+2, c)~ board.occupied_slot
			other_slots_unchanged:
				board.matches_slots_except (board, r, r+1, c, c)
		end

feature {NONE} -- Moves Query
	moves_possible(r,c:INTEGER):BOOLEAN
			-- Checks to see if a move is possible in all four directions
		local
			right_move:BOOLEAN
			left_move:BOOLEAN
			up_move:BOOLEAN
			down_move:BOOLEAN

			bounded_right:BOOLEAN
			bounded_left:BOOLEAN
			bounded_up:BOOLEAN
			bounded_down:BOOLEAN
		do
--			bounded_right:=board.is_valid_column (c+2)
--			bounded_left:=board.is_valid_column (c-2)
--			bounded_up:=board.is_valid_row (r-2)
--			bounded_down:=board.is_valid_row (r+2)

			bounded_right:=(c+2)<=7
			bounded_left:=(c-2)>=1
			bounded_up:=(r-2)>=1
			bounded_down:=(r+2)<=7

			if bounded_right = true then
				right_move:=board.status_of  (r,c) = board.occupied_slot
				and board.status_of (r,c + 1) = board.occupied_slot
				and board.status_of (r,c + 2) = board.unoccupied_slot
			end
			if bounded_left=true then
				left_move:=board.status_of(r,c)=board.occupied_slot
				and board.status_of (r,c-1) = board.occupied_slot
				and board.status_of (r,c-2) = board.unoccupied_slot
			end
			if bounded_up= true then
				up_move:=board.status_of(r,c) = board.occupied_slot
				--and board.status_of (r,c + 1) = board.occupied_slot
				--and board.status_of (r,c + 2) = board.unoccupied_slot
				and board.status_of (r-1,c) = board.occupied_slot
				and board.status_of (r-2,c) = board.unoccupied_slot
			end
			if bounded_down=true then
				down_move:=board.status_of(r,c) = board.occupied_slot
				and board.status_of (r+1,c) = board.occupied_slot
				and board.status_of (r+2,c) = board.unoccupied_slot
			end

			Result:= right_move or left_move or up_move or down_move
		end

feature -- Status Queries
	is_over: BOOLEAN
			-- Is the current game 'over'?
			-- i.e., no further movements are possible.
		do
			Result:= not
			across
				 1 |..| board.number_of_rows as m
			some
				across
					1 |..| board.number_of_columns as n
				some
					moves_possible (m.item,n.item)
				end
			end
		ensure
			correct_result:
				Result= not
				across
					 1 |..| board.number_of_rows as m
				some
					across
						1 |..| board.number_of_columns as n
					some
						moves_possible (m.item,n.item)
					end
				end
		end

	is_won: BOOLEAN
			-- Has the current game been won?
			-- i.e., there's only one occupied slot on the board.
		do
			Result := board.number_of_occupied_slots = 1
		ensure
			game_won_iff_one_occupied_slot_left:
				Result = (board.number_of_occupied_slots=1)
			winning_a_game_means_game_over:
				Result implies is_over
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
