DStructView = require './d-struct-view'

module.exports =
  dStructView: null

  activate: (state) ->
    @dStructView = new DStructView(state.dStructViewState)

  deactivate: ->
    @dStructView.destroy()

  serialize: ->
    dStructViewState: @dStructView.serialize()
