import Apps from "gi://AstalApps"
import { App, Astal, Gdk, Gtk } from "astal/gtk3"
import { Variable, bind } from "astal"
import Wp from "gi://AstalWp"
import MprisPlayers from "./MediaPlayer"

function hide() {
    App.get_window("dashboard")!.hide()
}

function SpeakerSlider() {
    const speaker = Wp.get_default()?.audio.defaultSpeaker!

    return <box className="AudioSlider" css="min-width: 140px">
        {/* <icon halign={Gtk.Align.CENTER} valign={Gtk.Align.CENTER} icon={bind(speaker, "volumeIcon")} /> */}
        <icon halign={Gtk.Align.CENTER} valign={Gtk.Align.CENTER} icon={"speaker"} />
        <slider
            hexpand
            onDragged={({ value }) => speaker.volume = value}
            value={bind(speaker, "volume")}
        />
    </box>
}

function MicrophoneSlider() {
    const microphone = Wp.get_default()?.audio.defaultMicrophone!

    return <box className="AudioSlider" css="min-width: 140px">
        {/* <icon halign={Gtk.Align.CENTER} valign={Gtk.Align.CENTER} icon={"micphone_30"} /> */}
        <icon halign={Gtk.Align.CENTER} valign={Gtk.Align.CENTER} icon={"micphone_100"} />
        <slider
            hexpand
            onDragged={({ value }) => microphone.volume = value}
            value={bind(microphone, "volume")}
        />
    </box>
}

export default function Dashboard() {
    const speaker_slider = new SpeakerSlider()
    const microphone_slider = new MicrophoneSlider()
    const mpris_players = new MprisPlayers()
    const text = Variable("")

    return <box widthRequest={300} spacing={10} orientation={1} expand className="Dashboard">
        {microphone_slider}
        {speaker_slider}
        {/* {mpris_players} */}
    </box>

}