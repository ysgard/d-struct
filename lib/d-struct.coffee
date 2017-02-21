# Grab a few objects that we'll need
popen = require('child_process').exec
platform = require('os').platform
paths = atom.project.getPaths().shift()

# TODO:--linux-support-still-needs-to-be-added-- Nope! All done
commands =
    build:
        win32: "start cmd /k \"cd #{paths} && dub run\""
        darwin: "osascript -e \'tell application \"Terminal\" to do script \"cd #{paths}; dub run\"\'"
        linux: "gnome-terminal -e \"bash -ic \'cd #{paths} && dub run && read -s -n 1 line\'\""
    run:
        win32: "start cmd /k \"cd \"#{paths}\" && dub build\""
        darwin: "osascript -e \'tell application \"Terminal\" to do script \"cd #{paths}; dub build\"\'"
        linux: "gnome-terminal -e \"bash -ic \'cd #{paths} && dub build && read -s -n 1 line\'\""

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
    atom.commands.add "atom-workspace", "d-struct:dub-build", => @dubbuild()
    atom.commands.add "atom-workspace", "d-struct:dub-run", => @dubrun()
  dubbuild: ->
    dub_build()
  dubrun: ->
    dub_run()
