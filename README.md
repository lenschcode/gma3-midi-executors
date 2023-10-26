# MA3 Midi Executors
### Allows you to map Midi Remotes in MA3 to Executors

## Installation
Download .zip from Releases or clone the repository into your "gma3_library/datapools/plugins/" folder. The name of the plugin folder needs to be "midi_executors" and all the files need to be in that folder.
Then in MA3 open up the plugin pool, edit an empty slot, then press "import" and select "midi_executors". After Installation you can simply press the plugin and it will open up a startup prompt.

## Usage
When pressing on the plugin you will have 2 options: "Start" and "Run Once". When you press Start the plugin will run and update the Midi assignment every 0.5 seconds, with "Run Once" the plugin will only update the midi mapping once to the current assigned sequences/masters of the executors.

Once the plugin is running pressing it again will open up a menu with the option to stop the plugin. 

## Assigning Midi Remotes
To assign Midi Remotes to Executors you simply have to change their name to the desired Executor in this format: "<Prefix> Executor <ExecId> <Key/Fader>", where Prefix can be any given prefix you want and ExecId any Executor number and <Key/Fader> needs to be set to either "Key" or "Fader", depending on whether you want the Midi Remote to have the Key or Fader action of the Executor.
### Examples:
`APC40 Fader 1 Executor 201 Fader`
`Launchpad Mini Button 1 Executor 101 Key`

## Notes
- All Midi remotes are currently assigned to the active page