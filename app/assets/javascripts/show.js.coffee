App.page =  
    active_users: {}

    new_user: (user) ->
        @active_users[user.name] = user
        @render_active_users()

    remove_user: (user) ->
        delete @active_users[user.name]
        @render_active_users()

    render_active_users: () ->
        $('#active_users_list').html(
            ("<li>#{user.name}</li>" for name,user of @active_users).join("")
        )
