DStructView = require './d-struct-view'

module.exports =
  dStructView: null

  activate: (state) ->
    @dStructView = new DStructView(state.dStructViewState)
    atom.config.set('d-struct.dub_location', 'Where is dub?')
    atom.config.observe 'd-struct.dub_location', ->
      console.log 'My config changed!  New dub loc:', atom.config.get('d-struct.dub_location')

  deactivate: ->
    @dStructView.destroy()

  serialize: ->
    dStructViewState: @dStructView.serialize()
