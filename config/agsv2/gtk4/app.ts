import app from "ags/gtk4/app"
import GLib from "gi://GLib"
import Gtk from "gi://Gtk?version=4.0"
import style from "./style.scss"

import Bar from "./widget/Bar"
import Applauncher from "./widget/Applauncher"
import NotificationPopups from "./widget/NotificationPopups"

let applauncher: Gtk.Window

app.start({
  css: style,
  icons: "../assets/icons",
  requestHandler(request, res) {
    const [, argv] = GLib.shell_parse_argv(request)
    if (!argv) return res("argv parse error")

    switch (argv[0]) {
      case "toggle":
        applauncher.visible = !applauncher.visible
        return res("ok")
      default:
        return res("unknown command")
    }
  },
  main() {
    // app.get_monitors().map(Bar)
    for (const monitor of app.get_monitors()) {
      console.log(monitor.model)
      if (monitor.model == "0x1600") {
        Bar(monitor)
        break
      }
    }
    applauncher = Applauncher() as Gtk.Window
    app.add_window(applauncher)
    // applauncher.present()
    // NotificationPopups()
  },
})
