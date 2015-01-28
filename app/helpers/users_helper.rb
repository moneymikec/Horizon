module UsersHelper
  def user_display(index)
    user = User.find_by(uid: @longest_array[index].to_s)
    "<h4>#{user.name} @#{user.username}</h4><p>#{user.bio}</p>".html_safe
  end
end
