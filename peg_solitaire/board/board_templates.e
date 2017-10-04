note
	description: "A collection of board templates for the peg solitaire game."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	BOARD_TEMPLATES

create {BOARD_TEMPLATES_ACCESS}
	make

feature {BOARD_TEMPLATES_ACCESS} -- Constructor
	make
			-- Initialize an object of board template constants.
			-- Do not modify this feature!
		do
			create default_board.make_default
			create easy_board.make_easy
			create cross_board.make_cross
			create plus_board.make_plus
			create pyramid_board.make_pyramid
			create arrow_board.make_arrow
			create diamond_board.make_diamond
			create skull_board.make_skull

			default_board_out := "[
				*******
				*******
				*******
				*******
				*******
				*******
				*******
				]"

			easy_board_out := "[
				***.***
				***O***
				***O***
				***.***
				***O***
				***.***
				*******
				]"

			cross_board_out := "[
				**...**
				**.O.**
				..OOO..
				...O...
				...O...
				**...**
				**...**
				]"

			plus_board_out := "[
				**...**
				**.O.**
				...O...
				.OOOOO.
				...O...
				**.O.**
				**...**
				]"

			pyramid_board_out := "[
				**...**
				**.O.**
				..OOO..
				.OOOOO.
				OOOOOOO
				**...**
				**...**
				]"

			arrow_board_out := "[
				**.O.**
				**OOO**
				.OOOOO.
				...O...
				...O...
				**OOO**
				**OOO**
				]"

			diamond_board_out := "[
				**.O.**
				**OOO**
				.OOOOO.
				OOO.OOO
				.OOOOO.
				**OOO**
				**.O.**
				]"

			skull_board_out := "[
				**OOO**
				**OOO**
				.OOOOO.
				.O.O.O.
				.OOOOO.
				**OOO**
				**OOO**
				]"
		end

feature -- Templates
	default_board: BOARD
	easy_board: BOARD
	cross_board: BOARD
	plus_board: BOARD
	pyramid_board: BOARD
	arrow_board: BOARD
	diamond_board: BOARD
	skull_board: BOARD

feature -- Constant String Representations of Boards
	default_board_out: STRING
	easy_board_out: STRING
	cross_board_out: STRING
	plus_board_out: STRING
	pyramid_board_out: STRING
	arrow_board_out: STRING
	diamond_board_out: STRING
	skull_board_out: STRING

invariant
	correct_default_board_output: True
		-- Your task.

	correct_easy_board_output: True
		-- Your task.

	correct_cross_board_output: True
		-- Your task.

	correct_plus_board_output: True
		-- Your task.

	correct_pyramid_board_output: True
		-- Your task.

	correct_arrow_board_output: True
		-- Your task.

	correct_diamond_board_output: True
		-- Your task.

	correct_skull_board_output: True
		-- Your task.

	consistent_default_board_outputs: True
		-- Your task.

	consistent_easy_board_outputs: True
		-- Your task.

	consistent_cross_board_outputs: True
		-- Your task.

	consistent_plus_board_outputs: True
		-- Your task.

	consistent_pyramid_board_outputs: True
		-- Your task.

	consistent_arrow_board_outputs: True
		-- Your task.

	consistent_diamond_board_outputs: True
		-- Your task.

	consistent_skull_board_outputs: True
		-- Your task.
end
