note
    description: "Summary description for {BAD_BOARD}."
    author: ""
    date: "$Date$"
    revision: "$Revision$"

class
    BAD_MATCHES_SLOT_EXCEPT
inherit
    BOARD
        redefine
            matches_slots_except
        end
create
    make

feature
    make
    do
        create imp.make_filled (ssa.occupied_slot, 7, 7)
    end

    feature --bad matches
    matches_slots_except(board: BOARD; r1,r2,c1,c2:INTEGER):BOOLEAN
        do
            Result := not Precursor (board, r1,r2,c1,c2)
        end

end
