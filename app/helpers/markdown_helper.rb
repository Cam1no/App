module MarkdownHelper
  def markdown(text)
    unless @markdown
      renderer = Redcarpet::Render::HTML.new
      @markdown = Redcarpet::Markdown.new(renderer, hard_wrap: true)
    end
    @markdown.render(text).html_safe
  end
end
