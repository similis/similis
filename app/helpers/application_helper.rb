module ApplicationHelper
  def title(page_title, show_title = true)
    content_for :title, page_title.to_s
    @show_title = show_title
  end

  def show_title?
    @show_title
  end

  def new_window_link_to(*args)
    link_to(args[0], args[1] || {}, (args[2] || {}).merge(:target => "_blank"))
  end
end
