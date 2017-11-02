module ApplicationHelper

	def flash_class(level)
    case level
        when 'notice' then "has-text-info"
        when 'success' then "has-text-success"
        when 'error' then "has-text-danger"
        when 'alert' then "has-text-danger"
    end
end
end
