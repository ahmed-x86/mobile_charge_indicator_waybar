# 📱 Mobile Charge Indicator for Waybar

A sleek and lightweight script to display your mobile phone's battery status directly in [Waybar](https://github.com/Alexays/Waybar) using **KDE Connect**.

![alt text](image.png)

---

## ✨ Features

* **Auto-Detection:** Automatically detects your connected phone's ID (No manual configuration needed!).
* **Dynamic Colors:** Changes module color based on battery levels (Normal, Warning, Critical).
* **Charging Indicator:** Displays a lightning icon (``) when the device is plugged in.
* **Quick Ping:** Click the module directly in Waybar to ring/ping your misplaced phone.

---

## 📦 Prerequisites

Before installing, ensure you have the following installed on your system:
* `kdeconnect` (Paired and connected with your mobile device)
* `waybar`
* A Nerd Font installed for the icons (e.g., *JetBrains Mono Nerd Font*).

---

## 🚀 Installation

Follow these simple steps to install the script:

1. Clone or open the repository folder:  
```bash
cd mobile_charge_indicator_waybar
```

Make the installer executable:

```Bash
chmod +x install.sh  
```
Run the installation script:

```Bash
./install.sh
```

(This script will automatically copy mobile.sh to your ~/.config/waybar/scripts/ directory and make it executable).
⚙️ Waybar Configuration

Open your Waybar config file (usually ~/.config/waybar/config or config.jsonc).

Add "custom/mobile" to your modules-right, modules-center, or modules-left array.

Add the following module definition:

```JSON
"custom/mobile": {
    "format": "{text}",
    "exec": "~/.config/waybar/scripts/mobile.sh",
    "interval": 30,
    "return-type": "json",
    "on-click": "~/.config/waybar/scripts/mobile.sh --ping" 
}
```

🎨 Waybar Style

Open your Waybar style file (usually ~/.config/waybar/style.css) and add the following snippet to customize the appearance:
CSS
```css
/* Mobile battery module */
#custom-mobile {
    font-family: "JetBrains Mono Nerd", monospace;
    font-size: 14px;
    padding: 0 6px;
    margin-left: 4px;
}

/* Colors based on battery status */
#custom-mobile.critical {
    color: #f07178; /* Red for low battery */
}
#custom-mobile.warning {
    color: #f2cd66; /* Yellow for medium battery */
}
#custom-mobile.normal {
    color: #c3e88d; /* Green for good battery */
}
```

💡 Usage

Once installed and configured, simply restart Waybar. Your mobile battery status will now be visible.

Left-click the module on your bar at any time to ping your device.

📝 Notes

 Ensure the KDE Connect daemon is running in the background and your device is properly paired.

Tested and perfectly working with Waybar on Linux.

🤝 Support

If you find this script useful for your ricing setup, please consider giving it a ⭐ on GitHub!
---