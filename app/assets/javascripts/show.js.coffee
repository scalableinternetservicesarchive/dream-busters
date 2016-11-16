App.page =  
    active_users: {}

    new_user: (user) ->
        @active_users[user.id] = user
        @render_active_users()

    remove_user: (user) ->
        delete @active_users[user.id]
        @render_active_users()

    render_active_users: () ->
        $('#active_users_list').html(
            ("<li>#{user.id}</li>" for id,user of @active_users).join("")
        )
