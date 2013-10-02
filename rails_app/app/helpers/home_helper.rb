module HomeHelper
  def format_post_date(date)
    date.strftime('%B %d, %Y @ %I:%M<span class="meridian">%p</span>').html_safe
  end
end
