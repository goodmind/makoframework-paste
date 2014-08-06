MakoframeworkPasteView = require './makoframework-paste-view'

module.exports =
  activate: ->
    atom.workspaceView.command "makoframework-paste:upload", => @upload()

  upload: ->
    # This assumes the active pane item is an editor
    editor = atom.workspace.activePaneItem
    clipboard = atom.clipboard
    request = require 'request'

    request.post 'http://paste.makoframework.com/', form: code: editor.getText(), (err, httpResponse, body) ->
        if err
          console.error 'fail:', err

        clipboard.write httpResponse.headers.location
