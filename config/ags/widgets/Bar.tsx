import { App } from "astal/gtk3"
import { Variable, GLib, bind } from "astal"
import { Astal, Gtk, Gdk } from "astal/gtk3"
import Hyprland from "gi://AstalHyprland"
import Mpris from "gi://AstalMpris"
import Battery from "gi://AstalBattery"
import Wp from "gi://AstalWp"
import Network from "gi://AstalNetwork"
import Tray from "gi://AstalTray"

// Custom
import Caffeine from "./Caffeine"
import SysTray from "./SysTray"
import Popup from "./Popup"
import Dashboard from "./Dashboard"

function Wifi() {
    const { wifi } = Network.get_default()

    return <icon
        tooltipText={bind(wifi, "ssid").as(String)}
        className="Wifi"
        icon={bind(wifi, "iconName")}
    />
}

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
            <box spacing={4}>
                <box
                    className="Cover"
                    margin-top={2}
                    valign={Gtk.Align.CENTER}
                    css={bind(ps[0], "coverArt").as(cover =>
                        `background-image: url('${cover}');`
                    )}
                />
                <label
                    className="MediaLabel"
                    max-width-chars={12}
                    truncate={true}
                    label={bind(ps[0], "title").as(() =>
                        `${ps[0].title} - ${ps[0].artist}`
                    )}
                />
            </box>
        ) : (
            ""
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

function Time({ format = "%Y-%m-%d  %H:%M  %A" }) {
    const time = Variable<string>("").poll(1000, () =>
        GLib.DateTime.new_now_local().format(format)!)

    return <button className="Time" onDestroy={() => time.drop()}>
        <box>
            <label onDestroy={() => time.drop()} label={time()}/>
        </box>
    </button>
}

function Indicator() {

    const popup = (
        <Popup name="dashboard" opacity={0.8} marginTop={50} marginRight={8} valign={Gtk.Align.START} halign={Gtk.Align.END}>
            <Dashboard>
                
            </Dashboard>
        </Popup>
    )
    App.add_window(popup)

    return <button className="DashboardButton"
        onClick={() => {popup.show()}}>
        <box spacing={6}>
            <Wifi />
            <BatteryLevel />
        </box>
    </button>
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
        layer={Astal.Layer.BOTTOM}
        anchor={TOP | LEFT | RIGHT}>
        <centerbox>
            <box spacing={4} hexpand halign={Gtk.Align.START}>
                <Workspaces />
                <FocusedClient />
            </box>
            <box>
                {/* <Media /> */}
                <Time />
            </box>
            <box spacing={6} hexpand halign={Gtk.Align.END} >
                <SysTray />
                <Caffeine />
                <Indicator />
            </box>
        </centerbox>
    </window>
}