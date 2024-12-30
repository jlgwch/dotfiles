import { App } from "astal/gtk3"
import { Variable, GLib, bind } from "astal"
import { Astal, Gtk, Gdk } from "astal/gtk3"
import Hyprland from "gi://AstalHyprland"
import Mpris from "gi://AstalMpris"
import Battery from "gi://AstalBattery"
import Wp from "gi://AstalWp"
import Network from "gi://AstalNetwork"

// Custom
import Caffeine from "./Caffeine"
import SysTray from "./SysTray"

function Wifi() {
    const { wifi } = Network.get_default()

    return <icon
        tooltipText={bind(wifi, "ssid").as(String)}
        className="Wifi"
        icon={bind(wifi, "iconName")}
    />
}

// function AudioSlider() {
//     const speaker = Wp.get_default()?.audio.defaultSpeaker!

//     return <box className="AudioSlider" css="min-width: 140px">
//         <icon icon={bind(speaker, "volumeIcon")} />
//         <slider
//             hexpand
//             onDragged={({ value }) => speaker.volume = value}
//             value={bind(speaker, "volume")}
//         />
//     </box>
// }

function BatteryLevel() {
    const bat = Battery.get_default()

    return <box className="Battery"
        visible={bind(bat, "isPresent")}>
        <icon icon={bind(bat, "batteryIconName")} />
        <label label={bind(bat, "percentage").as(p =>
            `${Math.floor(p * 100)}%`
        )} />
    </box>
}

function Media() {
    const mpris = Mpris.get_default()

    return <box className="Media">
        {bind(mpris, "players").as(ps => ps[0] ? (
            <box spacing={2}>
                <box
                    className="Cover"
                    valign={Gtk.Align.CENTER}
                    css={bind(ps[0], "coverArt").as(cover =>
                        `background-image: url('${cover}');`
                    )}
                />
                <label
                    className="MediaLabel"
                    label={bind(ps[0], "title").as(() =>
                        `${ps[0].title} - ${ps[0].artist}`
                    )}
                />
            </box>
        ) : (
            "Nothing Playing"
        ))}
    </box>
}

function Workspaces() {
    const hypr = Hyprland.get_default()

    return <box spacing={2} className="Workspaces">
        {bind(hypr, "workspaces").as(wss => wss
            .filter(({ id }) => id > 0)
            .sort((a, b) => a.id - b.id)
            .map(ws => (
                <button
                    className={bind(hypr, "focusedWorkspace").as(fw =>
                        ws === fw ? "focused" : "")}
                    onClicked={() => ws.focus()}>
                    {ws.id}
                </button>
            ))
        )}
    </box>
}

function FocusedClient() {
    const hypr = Hyprland.get_default()
    const focused = bind(hypr, "focusedClient")

    return <box
        className="Focused"
        visible={focused.as(Boolean)}>
        {focused.as(client => (
            client && <label max-width-chars={26} truncate={true} label={bind(client, "title").as(String)} />
        ))}
    </box>
}

function Time({ format = "%H:%M - %A %e." }) {
    const time = Variable<string>("").poll(1000, () =>
        GLib.DateTime.new_now_local().format(format)!)

    return <label
        className="Time"
        onDestroy={() => time.drop()}
        label={time()}
    />
}

function Dashboard() {
    return <box>
        <button className="DashboardButton"
        onClick={() => {App.toggle_window('dashboard')}}>
            <box spacing={6}>
                <Wifi />
                <BatteryLevel />
            </box>
        </button>
    </box>
}

export default function Bar(monitor: Gdk.Monitor) {
    const { TOP, LEFT, RIGHT } = Astal.WindowAnchor

    return <window
        className="Bar"
        gdkmonitor={monitor}
        margin-top={8}
        margin-left={8}
        margin-right={8}
        exclusivity={Astal.Exclusivity.EXCLUSIVE}
        anchor={TOP | LEFT | RIGHT}>
        <centerbox>
            <box spacing={4} hexpand halign={Gtk.Align.START}>
                <Workspaces />
                <FocusedClient />
            </box>
            <box>
                <Time />
            </box>
            <box spacing={6} hexpand halign={Gtk.Align.END} >
                {/* <Media /> */}
                <SysTray />
                <Caffeine />
                <Dashboard />
            </box>
        </centerbox>
    </window>
}