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
        <icon icon={bind(speaker, "volumeIcon")} />
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
        <icon icon={"micphone_30"} />
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
    // const microphone_slider = new MicrophoneSlider()

    return <window
        name="dashboard"
        anchor={Astal.WindowAnchor.TOP | Astal.WindowAnchor.RIGHT}
        exclusivity={Astal.Exclusivity.IGNORE}
        keymode={Astal.Keymode.ON_DEMAND}
        application={App}
        visible={false}
        onShow={() => text.set("")}
        margin-top={50}
        margin-right={6}
        onKeyPressEvent={function (self, event: Gdk.Event) {
            if (event.get_keyval()[1] === Gdk.KEY_Escape)
                self.hide()
        }}>
        <box widthRequest={300} spacing={20} orientation={1} expand className="content">
            {/* <label label="No match found" />
            <label label="No match found" />
            <label label="No match found" />
            <label label="No match found" />
            <label label="No match found" /> */}
            {microphone_slider}
            {speaker_slider}
            {/* {mpris_players} */}
        </box>
    </window>

}