import { Bar } from "./bar/bar.js"
import { applauncher } from "./applauncher/applauncher.js"
import * as Generic from './lib/utils.js'

const { Gdk, Gtk } = imports.gi
Gtk.IconTheme.get_default().append_search_path(`${App.configDir}/assets/icons`)

App.config({
    style: "./style.css",
    windows: [
        Bar(Generic.getMonitorIDByName("eDP-1")),
        applauncher

        // you can call it, for each monitor
        // Bar(0),
        // Bar(1)
    ],
})

export { }
