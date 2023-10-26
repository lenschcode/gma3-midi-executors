# MA3 Midi Executors
### Allows you to map Midi Remotes in MA3 to Executors

## Installation
Download .zip from [Releases](https://github.com/lenschcode/MA3-Midi-Executors/releases/latest) or clone the repository into your `gma3_library/datapools/plugins/`folder. The name of the plugin folder needs to be `midi_executors` and all the files need to be in that folder.
Then in MA3 open up the plugin pool, edit an empty slot, then press "import" and select `midi_executors`. After Installation you can simply press the plugin and it will open up a startup prompt.

## Usage
When pressing on the plugin you will have 2 options: "Start" and "Run Once". When you press Start the plugin will run and update the Midi assignment every 0.5 seconds, with "Run Once" the plugin will only update the midi mapping once to the current assigned sequences/masters of the executors.

Once the plugin is running pressing it again will open up a menu with the option to stop the plugin. 

## Configuration
### Create Midi Remotes 
Create the Midi Remotes with your input settings: Channel, Note and Type. These configurations will not be changed by the plugin.

### Assign Midi Remotes to Executors
In order to assign Midi Remotes to Executors you simply have to change their name to the desired Executor in this format: `<Prefix> Executor <ExecId> <Key/Fader>`, where `<Prefix>` can be any given prefix text, `<ExecId>` any Executor number and `<Key/Fader>` needs to be set to either "Key" or "Fader", depending on whether you want the Midi Remote to have the Key or Fader action of the Executor.
#### Examples:
`APC40 Fader 1 Executor 201 Fader`
`Launchpad Mini Button 1 Executor 101 Key`

### Refreshrate
If you want to change the refresh rate of the plugin checking the executor assignment you can change `local rate = 0.5` in the top of the plugin to any number in seconds, although 0.5 is recommended for almost instant updating.

## Notes
- All Midi remotes are currently assigned to the active page
- All other options for the Midi Remotes won't be changed by the plugin
- Locking the Midi Remotes will prevent the plugin from changing it's assignment