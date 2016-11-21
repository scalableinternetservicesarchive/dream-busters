App.page =
    active_users: {}

    set_current_user: (user) ->
        @current_user = user

    new_user: (user) ->
        @active_users[user.name] = user
        @number_users()
        @render_active_users()
        # @render_selected_line()

    number_users: () ->
        num = 0
        for name,user of @active_users
            if name != @current_user.name
                num += 1
                user.num = num

    remove_user: (user) ->
        delete @active_users[user.name]
        @render_active_users()

    render_active_users: () ->
        $('#active_users_list').html(
            ("<li class=\"user-#{user.num}\">#{user.name}</li>" for name,user of @active_users).join("")
        )

    # render_selected_line: () ->
    #     for line in @selected_line
    #         if cell.classList.contains("current")
    #             cell.classList = "current"
    #         else
    #             cell.classList = ""

    #     @selected_cells = []
    #     for id, user of @active_users
    #         if id != @current_user.id && (cells = user.selected_cells)
    #             @selected_cells.push(cells)
    #             cell = @hot.getCell(cells.r, cells.c)
    #             cell.classList.add('user-' + user.num)

    setup: () ->
        container = document.getElementById('ace')
        EditSession = ace.require("ace/edit_session").EditSession
        @aceEditor = ace.edit(container)
        @aceEditor.setSession('')
        ace.config.set 'basePath', '/ace'
        @aceEditor.setTheme 'ace/theme/twilight'
        @aceEditor.getSession().setMode 'ace/mode/c_cpp'
        @aceEditor.setShowPrintMargin false
        # aceEditor.session.textarea.closest('form').submit ->
        #     textarea.val aceEditor.getValue()
        @aceEditor.on 'change', (event) ->
            selected = event.end
            deselected = event.start
            # @select_line(selected)
            # Range = ace.require('ace/range').Range
            # @aceEditor.session.addMarker(new Range(1, 1, 2, 2), "myMarker", "fullLine")

    select_line: (line) ->
        App.active_users.select_line(line)

    deselect_line: () -> App.active_users.select_line(null)

$ -> App.page.setup()
