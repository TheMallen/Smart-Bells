module ApplicationHelper

  def shim
    render 'shared/shim'
  end

  def header
    render 'shared/header'
  end

  def link_active(path)
    "active" if current_page?(path)
  end

end
