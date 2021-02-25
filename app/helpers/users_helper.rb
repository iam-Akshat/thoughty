module UsersHelper
  def following_user?(diff_user)
    f = Following.find_by(follower: current_user, followed: diff_user)
    if f.nil?
      false
    else
      true
    end
  end
end
