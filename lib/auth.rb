# frozen_string_literal: true

module Auth
  def sign_in(username, remember_me: false)
    if remember_me
      cookies.permanent[:uid] = username
      cookies.permanent[:username] = username
    else
      cookies[:uid] = username
      cookies[:username] = username
    end
  end

  def sign_out
    cookies[:uid] = nil
    cookies[:username] = nil
  end

  def signed_in?
    cookies[:uid].present?
  end

  def current_user
    @_current_user ||= User.find_by login: cookies[:username]
  end

  def redirect_role_path(user)
    result = AuthorizeUser.call(user: user)
    redirect_to result.next_path if result.success?
  end

  def authenticate_user!
    redirect_to new_session_path(from: request.path) unless signed_in?
  end

  def authenticate_admin!
    if signed_in?
      user = User.find_by login: cookies[:username]
      render_404 if user.role.developer?
    else
      redirect_to new_session_path(from: request.path)
    end
  end

  def authenticate!
    redirect_to new_session_path(from: request.path) unless signed_in?
  end

  private

  def render_404
    raise ActionController::RoutingError, 'Not Found'
  end
end
