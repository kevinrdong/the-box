module ApplicationHelper

	def flash_class(level)
    case level
        when 'notice' then "has-text-centered has-text-info"
        when 'success' then "has-text-centered has-text-success"
        when 'error' then "has-text-centered has-text-danger"
        when 'alert' then "has-text-centered has-text-danger"
    end
    end

    def work
    	work = Work.first
    end
end
