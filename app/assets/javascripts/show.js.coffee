App.page =
    active_users: {}
    page_editor: {}
    old_line_num: {}

    set_current_user: (user) ->
        @current_user = user

    new_user: (user) ->
        @active_users[user.name] = user
        @number_users()
        @render_active_users()
        @render_selected_line()

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
            ("<li class=\"user-#{user.num}\">#{name}</li>" for name,user of @active_users).join("")
        )

    render_selected_line: () ->
        for marker in @markers
            @page_editor.session.removeMarker(marker)
        @markers = []
        for name, user of @active_users
            if name != @current_user.name && (line = user.selected_line)
                console.log "line = "+line
                Range = ace.require('ace/range').Range
                marker = @page_editor.session.addMarker(new Range(line, 0, line, 1), "myMarker", "fullLine")
                @markers.push(marker)

    setup: () ->
        @markers = []
        ace.config.set 'basePath', '/ace'
        container = document.getElementById('ace')
        editor = ace.edit(container)
        @page_editor = editor
        doc = ace.createEditSession('\n\n\n\n\n\n\n', 'ace/mode/c_cpp')
        editor.setSession(doc)
        editor.setTheme 'ace/theme/github'
        editor.session.setMode 'ace/mode/c_cpp'
        editor.setShowPrintMargin false
        # editor.session.textarea.closest('form').submit ->
        #     textarea.val editor.getValue()
        editor.on 'changeSelection', (event) ->
            cursor = editor.selection.getCursor()
            row = cursor.row
            column = cursor.column
            console.log row+", "+column

            value = editor.session.getLine(App.page.old_line_num)
            console.log "old row = "+App.page.old_line_num+", old value = "+value
            App.editor_lines.set_line_value(App.page.old_line_num, value)
            App.page.select_line(row)
            App.page.old_line_num = row

    select_line: (line) ->
        App.active_users.select_line(line)

    update_line: (update) ->
        line_num = update.line_num
        value = update.value
        Range = ace.require('ace/range').Range
        @page_editor.session.replace(new Range(line_num, 0, line_num, Number.MAX_VALUE), value)

$ -> App.page.setup()
