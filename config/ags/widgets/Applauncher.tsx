import Apps from "gi://AstalApps"
import { App, Astal, Gdk, Gtk } from "astal/gtk3"
import { Variable } from "astal"

import Popup from "./Popup"

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
    const popup = (
        <Popup name="launcher"  >
        <box widthRequest={480} heightRequest={600} className="Applauncher" orientation={1}>
        <entry
            // margin-left={10}
            // margin-right={10}
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
        </Popup>
    )

    App.add_window(popup)
}
