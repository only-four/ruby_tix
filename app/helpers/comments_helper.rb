module CommentsHelper
  def click_for_more_comments(activity, comments)
    link_to("更多留言", activity_path(activity), remote: true, class: "btn coin-comment__load-more-btn ", id: "js-load-more-comments")
  end
end
