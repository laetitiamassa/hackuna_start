module ApplicationHelper
	def markdown(text)
      markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, hard_wrap: true, autolink: true, quote: true, fenced_code_blocks: true, strikethrough: true)
       return markdown.render(text).html_safe
  end
end
