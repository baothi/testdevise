module Admin::SessionsHelper
  # Logs in the given user.
  def log_in(admin_admin)
    session[:admin_admin_id] = admin_admin.id
  end

  def remember(admin_admin)
    admin_admin.remember
    cookies.permanent.signed[:admin_admin_id] = admin_admin.id
    cookies.permanent[:remember_token] = admin_admin.remember_token
  end

   # Returns the current logged-in user (if any).
  def current_user
    if (admin_admin_id = session[:admin_admin_id])
      @current_user ||= Admin::Admin.find_by(id: admin_admin_id)
    elsif (admin_admin_id = cookies.signed[:admin_admin_id])
      admin_admin = Admin::Admin.find_by(id: admin_admin_id)
      if admin_admin && admin_admin.authenticated?(:remember, cookies[:remember_token])
        log_in admin_admin
        @current_user = admin_admin
      end
    end
  end

   # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end
  
   # Returns true if the given user is the current user.
  def current_user?(admin_admin)
    admin_admin == current_user
  end

  # Forgets a persistent session.
  def forget(admin_admin)
    # admin_admin.forget
    cookies.delete(:admin_admin_id)
    cookies.delete(:remember_token)
  end

   # Logs out the current user.
  def log_out
    forget(current_user)
    session.delete(:admin_admin_id)
    @current_user = nil
  end
  
  # Redirects to stored location (or to the default).
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end
  

  # Stores the URL trying to be accessed.
  def store_location
    session[:forwarding_url] = request.url if request.get?
  end
  
end
