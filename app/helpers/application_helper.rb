module ApplicationHelper
  def admin_nav_class(url)
    if url == admin_path
      if request.fullpath == admin_path
        return 'class="active"'.html_safe
      else
        return ''
      end
    end
    if request.fullpath.starts_with? url
      return 'class="active"'.html_safe
    else
      return ''
    end
  end
end
