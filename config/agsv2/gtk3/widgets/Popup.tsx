import { Variable } from "astal"
import { App, Astal, Gdk, Gtk } from "astal/gtk3/app"

const { TOP, RIGHT, BOTTOM, LEFT } = Astal.WindowAnchor

type PopupProps = {
    child?: unknown
    name?: ""
    opacity?: number
    marginBottom?: number
    marginTop?: number
    marginLeft?: number
    marginRight?: number
    halign?: Gtk.Align
    valign?: Gtk.Align
}

export default function Popup({
    child,
    name,
    opacity,
    marginBottom,
    marginTop,
    marginLeft,
    marginRight,
    halign = Gtk.Align.CENTER,
    valign = Gtk.Align.CENTER,
}: PopupProps) {
    return (
        <window
            name={name}
            opacity={opacity}
            visible={false}
            css="background-color: transparent"
            keymode={Astal.Keymode.EXCLUSIVE}
            // anchor={TOP}
            anchor={TOP | RIGHT | BOTTOM | LEFT}
            exclusivity={Astal.Exclusivity.IGNORE}
            // close when click occurs otside of child
            onButtonPressEvent={(self, event) => {
                const [, _x, _y] = event.get_coords()
                const { x, y, width, height } = self
                    .get_child()!
                    .get_allocation()

                const xOut = _x < x || _x > x + width
                const yOut = _y < y || _y > y + height

                // clicked outside
                if (xOut || yOut) self.hide()
            }}
            // close when hitting Escape
            onKeyPressEvent={(self, event: Gdk.Event) => {
                if (event.get_keyval()[1] === Gdk.KEY_Escape) {
                    self.hide()
                }
            }}
        >
            <box
                className="Popup"
                onButtonPressEvent={() => true} // make sure click event does not bubble up
                // child can be positioned with `halign` `valign` and margins
                expand
                halign={halign}
                valign={valign}
                marginBottom={marginBottom}
                marginTop={marginTop}
                marginStart={marginLeft}
                marginEnd={marginRight}
            >
                {child}
            </box>
        </window>
    )
}