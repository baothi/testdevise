class Admin::BaseController < ApplicationController
  layout "admin"
  before_filter :authenticate_admin_user!   #, :require_chrome_browser
  # include StreamProgressPrintable

  # PER_PAGE_OPTIONS = [10, 20, 50, 100]
  # DEFAULT_PER_PAGE = 10

  def require_admin
    unless current_admin_user.admin?
      render text: "ban khong co quyen vao trang nay"
    end
  end

  def require_chrome_browser
    unless request.user_agent =~ /Chrome/ or request.user_agent =~ /CriOS/
      render text: "Ban nen mo trinh duyet GoogleChrome"
    end
  end
end
