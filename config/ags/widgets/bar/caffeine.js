export function Caffeine() {
    let isCaffeineOn = false;
    let icon = Widget.Icon({ icon: 'caffeine_off'});

    Utils.execAsync(`hyprctl dispatch exec hypridle`);

    function updateCaffeineStatus() {
        if (isCaffeineOn) {
            icon.icon = 'caffeine_on'
            Utils.execAsync(`killall hypridle`);
        } else {
            icon.icon = 'caffeine_off'
            Utils.execAsync(`hyprctl dispatch exec hypridle`);
        }
    }

    return Widget.Button({
        class_name: "caffeine",
        child: icon,
        onClicked: () => {
            isCaffeineOn = !isCaffeineOn;
            updateCaffeineStatus();
        },
    });
}