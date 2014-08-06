{WorkspaceView} = require 'atom'
MakoframeworkPaste = require '../lib/makoframework-paste'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "MakoframeworkPaste", ->
  activationPromise = null

  beforeEach ->
    atom.workspaceView = new WorkspaceView
    activationPromise = atom.packages.activatePackage('makoframework-paste')

  describe "when the makoframework-paste:toggle event is triggered", ->
    it "attaches and then detaches the view", ->
      expect(atom.workspaceView.find('.makoframework-paste')).not.toExist()

      # This is an activation event, triggering it will cause the package to be
      # activated.
      atom.workspaceView.trigger 'makoframework-paste:toggle'

      waitsForPromise ->
        activationPromise

      runs ->
        expect(atom.workspaceView.find('.makoframework-paste')).toExist()
        atom.workspaceView.trigger 'makoframework-paste:toggle'
        expect(atom.workspaceView.find('.makoframework-paste')).not.toExist()
