# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

    def format_vote(vote)
        return "Nebalso" if vote == 0
        return "Par" if vote == 1
        return "Pret" if vote == 2
        return "Atturas" if vote == 3
        return "?"
    end

end
