import { App } from "astal/gtk3"
import style from "./style.scss"
import Bar from "./widgets/Bar"
import Applauncher from "./widgets/Applauncher"
import Dashboard from "./widgets/Dashboard"

App.start({
    css: style,
    instanceName: "astal",
    requestHandler(request, res) {
        print(request)
        res("ok")
    },
    icons: "./assets/icons",
    main: () => {
        // App.get_monitors().map(Bar)
        for (const monitor of App.get_monitors()) {
            console.log(monitor.model)
            if(monitor.model == "0x1600") {
                Bar(monitor)
            }
        }
        Applauncher()
        Dashboard()
    },
})