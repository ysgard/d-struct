# Grab a few objects that we'll need
popen = require('child_process').exec
path = require('path')
platform = require('os').platform

# Open a terminal and run dub
run_dub = ->
  # Run the terminal app
  cmdline = "osascript -e \'tell application \"Terminal\" to do script \"cd #{atom.project.path}; dub\"\'"
  popen cmdline

module.exports =
  # Bind workspace command to run_dub
  activate: (state) ->
    atom.workspaceView.command "d-struct:dub", => @rundub()
  rundub: ->
    run_dub()
