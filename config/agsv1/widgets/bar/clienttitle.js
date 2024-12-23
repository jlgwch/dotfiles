const hyprland = await Service.import("hyprland")

export function ClientTitle() {
    return Widget.Label({
        class_name: "client-title",
        label: hyprland.active.client.bind("title"),
        justification: 'left',
        truncate: 'end',
        xalign: 0,
        maxWidthChars: 50,
        wrap: true,
        useMarkup: true,
    })
}