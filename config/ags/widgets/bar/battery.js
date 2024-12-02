const battery = await Service.import('battery')

// const batteryProgress = Widget.CircularProgress({
//     child: Widget.Icon({
//         icon: battery.bind('icon_name')
//     }),
//     visible: battery.bind('available'),
//     value: battery.bind('percent').as(p => p > 0 ? p / 100 : 0),
//     class_name: battery.bind('charging').as(ch => ch ? 'charging' : ''),
// })

// export function Battery() {
//     return Widget.CircularProgress({
//         // child: Widget.Icon({
//         //     icon: battery.bind('icon_name')
//         // }),
//         visible: battery.bind('available'),
//         value: battery.bind('percent').as(p => p > 0 ? p / 100 : 0),
//         class_name: battery.bind('charging').as(ch => ch ? 'charging' : ''),
//     })
// }

export function Battery() {
    // const value = battery.bind("percent").as(p => p > 0 ? p / 100 : 0)
    const value = battery.bind("percent").as(p => p > 0 ? `${p}%` : "0%")
    const icon = battery.bind("percent").as(p => `battery-level-${Math.floor(p / 10) * 10}-symbolic`)

    return Widget.Box({
        visible: battery.bind("available"),
        children: [
            Widget.Icon({ icon }),
            Widget.Label( {label:value} ),
        ],
    })
}