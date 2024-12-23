const audio = await Service.import("audio")

export function Micphone() {
    const icons = {
        100: "micphone_100",
        90: "micphone_90",
        80: "micphone_80",
        70: "micphone_70",
        60: "micphone_60",
        50: "micphone_50",
        40: "micphone_40",
        30: "micphone_30",
        20: "micphone_20",
        10: "micphone_10",
        1: "micphone_01",
        0: "micphone_0",
    }

    function getIcon() {
        const icon = audio.microphone.is_muted ? 0 : [100, 90, 80, 70, 60, 50, 40, 30, 20, 10, 1, 0].find(
            threshold => threshold <= audio.microphone.volume * 100)

        return `${icons[icon]}`
    }

    const slider = Widget.Slider({
        hexpand: true,
        draw_value: false,
        on_change: ({ value }) => audio.microphone.volume = value,
        setup: self => self.hook(audio.microphone, () => {
            self.value = audio.microphone.volume || 0
        }),
    })

    const icon = Widget.Icon({
        icon: Utils.watch(getIcon(), audio.microphone, getIcon),
    })

    return Widget.Box({
        class_name: "volume",
        css: "min-width: 180px",
        children: [icon, slider],
    })
}