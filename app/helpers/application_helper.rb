module ApplicationHelper 
    include Pagy::Frontend
    def formatted_date(date)
        date.strftime('%A, %b %d, %Y') if date.present?
    end
end
