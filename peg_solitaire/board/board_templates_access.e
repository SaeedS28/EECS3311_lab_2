note
	description: "Singleton access to board templates."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

expanded class
	BOARD_TEMPLATES_ACCESS

feature -- Access to board templates
	templates: BOARD_TEMPLATES
		do
			-- Your task: the current implementation
			-- may not be correct.
			create Result.make
		end

invariant
	singleton_templates: True
		-- Your task.
end
