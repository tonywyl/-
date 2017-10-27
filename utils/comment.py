def comment_tree(comment_list):
    """
    获取梯级评论
    :param comment_list:
    :return:
    """
    wrapper="<div class='comment'>"
    for row in comment_list:
        inner="<div class='content'><p style='color:blue;'>%s评论:&nbsp;&nbsp;%s--发表时间:%s</p></div>"%(row['user__nickname'],row['content'],row['create_time'])
        wrapper+=inner
        if row['child']:
            wrapper+=comment_tree(row['child'])
    wrapper+='</div>'

    return wrapper






















































