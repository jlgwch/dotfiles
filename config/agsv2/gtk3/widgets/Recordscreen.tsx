import { App, Astal, Gtk, Gdk } from "astal/gtk3/app";
import { bind, Gio, Variable } from "astal";
import { exec, execAsync } from "astal/process"


export default function Recordscreen() {
    // 创建菜单
    const menu = new Gtk.Menu();

    // 创建菜单项
    const item1 = new Gtk.MenuItem({ label: 'Item 1' });
    const item2 = new Gtk.MenuItem({ label: 'Item 2' });
    const item3 = new Gtk.MenuItem({ label: 'Item 3' });
    const item4 = new Gtk.MenuItem({ label: 'fullscreen with sound' });

    // 将菜单项添加到菜单
    menu.append(item1);
    menu.append(item2);
    menu.append(item3);
    menu.append(item4);

    // 显示菜单项
    item1.show();
    item2.show();
    item3.show();
    item4.show();

    item1.connect('activate', () => {
        console.log('Item 1 clicked');
    });

    item2.connect('activate', () => {
        console.log('Item 2 clicked');
    });

    item3.connect('activate', () => {
        console.log('Item 3 clicked');
    });

    item4.connect('activate', () => {
        // execAsync(`bash ~/.config/hypr/scripts/record-script.sh --fullscreen-sound`)
    });

    let statusIcon = <icon icon={"record_screen_off"} />;

    // function updateCaffeineStatus() {
    //     if (isCaffeineOn) {
    //         statusIcon.icon = 'caffeine_on'
    //         execAsync(`killall hypridle`);
    //     } else {
    //         statusIcon.icon = 'caffeine_off'
    //         execAsync(`hyprctl dispatch exec hypridle`);
    //     }
    // }

    return <box className="Recordscreen">
        <button
            className="Recordscreen"
            onClick={(self, event) => {
                if (event.button === Gdk.BUTTON_PRIMARY) {

                }
                if (event.button === Gdk.BUTTON_SECONDARY) {
                    menu?.popup_at_widget(self, Gdk.Gravity.SOUTH, Gdk.Gravity.NORTH_EAST, null)
                }
            }}
        >
            {statusIcon}
        </button>
    </box>

}