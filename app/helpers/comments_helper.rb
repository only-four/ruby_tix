module CommentsHelper
  def click_for_more_comments(activity, comments)
    link_to("更多留言", activity_path(activity), remote: true, class: "more-comments", id: "js-more-comments-btn")
  end
end
