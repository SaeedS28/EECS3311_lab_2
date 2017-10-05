note
	description: "Singleton access to board templates."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

expanded class
	BOARD_TEMPLATES_ACCESS

feature -- Access to board templates
	templates: BOARD_TEMPLATES
		once
			-- original implementation was incorrect because it did not
			-- use the singleton design pattern
			create Result.make
		end

invariant
	singleton_templates: templates = templates
end
