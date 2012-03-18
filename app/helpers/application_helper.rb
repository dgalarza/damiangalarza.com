module ApplicationHelper

  # Format the publish date for display purposes
  #
  # @example 
  #   August 6, 1986
  #
  def format_date(date)
    date.strftime('%B %d, %Y')
  end

end
