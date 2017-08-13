'use babel';

import DStructView from './d-struct-view';
import { CompositeDisposable } from 'atom';

const { exec } = require('child_process')


export default {

  dStructView: null,

  activate(state) {
    this.dStructView = new DStructView(state.dStructViewState);
    this.modalPanel = atom.workspace.addModalPanel({
      item: this.dStructView.getElement(),
      visible: false
    });

    // Events subscribed to in Atom's system can be easily
    // cleaned up with a CompositeDisposable
    this.subscriptions = new CompositeDisposable();

    // Register command that toggles this view
    this.subscriptions.add(atom.commands.add('atom-workspace', {
      'd-struct:build': () => this.dub_build()
    }))
    this.subscriptions.add(atom.commands.add('atom-workspace', {
      'd-struct:run': () => this.dub_run()
    }))
  },

  dub_it(dub_cmd) {
    let cmd = ''
    switch(process.platform) {
      case 'win32':
        cmd = "start cmd /k \"cd \"" + atom.project.getPaths().shift() + "\" && dub " + dub_cmd + "\""
        break
      case 'darwin':
        cmd = "osascript -e \'tell application \"Terminal\" to do script \"cd " + atom.project.getPaths().shift() + "; dub " + dub_cmd + "\"\'"
        break
      case 'linux':
        cmd = "xterm -e \"bash -c \'cd " + atom.project.getPaths().shift() + "; dub " + dub_cmd + "; echo $?; read -s -n 1 line\'\""
        break
      default:
        atom.notifications.addWarning("No dub integration for " + process.platform)
        return
    }
    exec(cmd)
  },

  dub_run() {
    this.dub_it('run')
  },

  dub_build() {
    this.dub_it('build')
  },

  deactivate() {
    this.modalPanel.destroy();
    this.subscriptions.dispose();
    this.DStructView.destroy();
  },

  serialize() {
    return {
      dStructViewState: this.dStructView.serialize()
    };
  },

  toggle() {
    console.log('DStruct was toggled!');
    return (
      this.modalPanel.isVisible() ?
        this.modalPanel.hide() :
        this.modalPanel.show()
    );
  }
}
