# Grab a few objects that we'll need
popen = require('child_process').exec
platform = require('os').platform

# TODO: linux support still needs to be added
commands =
    build:
        win32: "start cmd /k \"cd #{atom.project.getPaths().shift()} && dub run\""
        darwin: "osascript -e \'tell application \"Terminal\" to do script \"cd #{atom.project.getPaths().shift()}; dub run\"\'"
    run:
        win32: "start cmd /k \"cd \"#{atom.project.getPaths().shift()}\" && dub build\""
        darwin: "osascript -e \'tell application \"Terminal\" to do script \"cd #{atom.project.getPaths().shift()}; dub build\"\'"

# Open a terminal and run dub
dub_build = ->
  # Run the terminal app
  popen commands.build[platform()] if platform() of commands.build

# Open a terminal and run the app with dub
dub_run = ->
  # Run the terminal app
  popen commands.run[platform()] if platform() of commands.run

module.exports =
  # Bind workspace command to run_dub
  activate: (state) ->
    atom.workspaceView.command "d-struct:dub-build", => @dubbuild()
    atom.workspaceView.command "d-struct:dub-run", => @dubrun()
  dubbuild: ->
    dub_build()
  dubrun: ->
    dub_run()
