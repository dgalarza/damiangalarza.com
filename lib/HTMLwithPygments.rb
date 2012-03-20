require 'redcarpet'

class HTMLwithPygments < Redcarpet::Render::HTML

  def block_code(block, language)
    highlight_options = { :encoding => 'utf-8', :tabwidth => 2 }
    Pygments.highlight(block, :lexer => language, :options => highlight_options)
  end

end
