import Apps from "gi://AstalApps"
import { App, Astal, Gdk, Gtk } from "astal/gtk3"
import { Variable } from "astal"

const MAX_ITEMS = 8

function hide() {
    App.get_window("launcher")!.hide()
}

function scroll(self, event, user_data) {
    // print(event)
}

function AppButton({ app }: { app: Apps.Application }) {
    return <button
        className="AppButton"
        onClicked={() => { hide(); app.launch() }}>
        <box valign={Gtk.Align.CENTER} >
            <icon icon={app.iconName} />
            <box valign={Gtk.Align.CENTER} vertical>
                <label
                    className="name"
                    truncate
                    xalign={0}
                    label={app.name}
                />
                {/* {app.description && <label
                    className="description"
                    wrap
                    xalign={0}
                    label={app.description}
                />} */}
            </box>
        </box>
    </button>
}

export default function Applauncher() {
    const { CENTER } = Gtk.Align
    const apps = new Apps.Apps()
    let app_list = apps.get_list()

    const text = Variable("")
    const list = text(text => apps.fuzzy_query(text).slice(0, app_list.length))
    const onEnter = () => {
        apps.fuzzy_query(text.get())?.[0].launch()
        hide()
    }

    return <window
        name="launcher"
        // anchor={Astal.WindowAnchor.TOP | Astal.WindowAnchor.BOTTOM}
        exclusivity={Astal.Exclusivity.IGNORE}
        keymode={Astal.Keymode.ON_DEMAND}
        application={App}
        visible={false}
        onShow={() => text.set("")}
        onKeyPressEvent={function (self, event: Gdk.Event) {
            if (event.get_keyval()[1] === Gdk.KEY_Escape)
                self.hide()
        }}>
        <box widthRequest={480} heightRequest={600} className="Applauncher" orientation={1}>
            <entry
                placeholderText="Search"
                text={text()}
                onChanged={self => text.set(self.text)}
                onActivate={onEnter}
            />
            <scrollable heightRequest={600} vscroll>
                <box spacing={6} orientation={1}>
                    {list.as(list => list.map(app => (
                        <AppButton app={app} />
                    )))}
                </box>
                {/* <box
                    halign={CENTER}
                    className="not-found"
                    vertical
                    visible={list.as(l => l.length === 0)}>
                    <icon icon="system-search-symbolic" />
                    <label label="No match found" />
                </box> */}
            </scrollable>
        </box>
    </window>
}
