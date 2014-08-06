{View} = require 'atom'

module.exports =
class MakoframeworkPasteView extends View
  @content: ->
    @div class: 'makoframework-paste overlay from-top', =>
      @div "The MakoframeworkPaste package is Alive! It's ALIVE!", class: "message"

  initialize: (serializeState) ->
    atom.workspaceView.command "makoframework-paste:toggle", => @toggle()

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @detach()

  toggle: ->
    console.log "MakoframeworkPasteView was toggled!"
    if @hasParent()
      @detach()
    else
      atom.workspaceView.append(this)
