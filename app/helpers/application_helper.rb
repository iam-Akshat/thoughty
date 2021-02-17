module ApplicationHelper
  def flash_shower
    unless flash[:error].nil? && flash[:notice].nil? && flash[:alert].nil? 
      '<div class="flash">' \
          "#{flash[:error] || flash[:notice] || flash[:alert]}" \
      "</div>" 
    end 
  end

  def signed_in?
    !params[:user_id].nil?
  end

  def current_user
    if signed_in?
      User.find(params[:user_id])
    else
      'Log in'
    end
  end
end
