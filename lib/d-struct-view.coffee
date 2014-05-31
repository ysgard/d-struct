{View} = require 'atom'

module.exports =
class DStructView extends View
  @content: ->
    @div class: 'd-struct overlay from-top', =>
      @div "The DStruct package is Alive! It's ALIVE!", class: "message"

  initialize: (serializeState) ->
    atom.workspaceView.command "d-struct:toggle", => @toggle()

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @detach()

  toggle: ->
    console.log "DStructView was toggled!"
    if @hasParent()
      @detach()
    else
      atom.workspaceView.append(this)
