module ApplicationHelper
	def markdown(text)
      markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, hard_wrap: true, autolink: true, quote: true, fenced_code_blocks: true, strikethrough: true)
       return markdown.render(text).html_safe
  end

   def display_base_errors resource
    return '' if (resource.errors.empty?) or (resource.errors[:base].empty?)
    messages = resource.errors[:base].map { |msg| content_tag(:p, msg) }.join
    html = <<-HTML
    <div class="alert alert-error alert-block">
      <button type="button" class="close" data-dismiss="alert">&#215;</button>
      #{messages}
    </div>
    HTML
    html.html_safe
  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
