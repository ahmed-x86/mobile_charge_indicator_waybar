

# Mobile Charge Indicator for Waybar

📱 Display your mobile battery status directly in Waybar using KDE Connect.

---

## Installation

Follow these steps to install and run the script:

1. Open the folder:  
```bash
cd mobile_charge_indicator_waybar
```
2. Make the scripts executable:  
```bash
chmod +x install.sh  
chmod +x install2.sh
```

3. Run the first installer:  
```bash
./install.sh
```

4. Run the second installer:  
```bash
./install2.sh
```

---

## Waybar Configuration

Add the following to your Waybar config file:
plese remove XXXXXXXXX & put your mobile id

```json
"custom/mobile": {
    "format": "{text}",
    "exec": "~/.config/waybar/scripts/mobile.sh",
    "interval": 30,
    "return-type": "json",
    "on-click": "~/.config/waybar/scripts/mobile.sh --ping" 
}
````

---

## Waybar Style

Open `~/.config/waybar/style.css` and add the following styles:

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
    color: #f07178;
}
#custom-mobile.warning {
    color: #f2cd66;
}
#custom-mobile.normal {
    color: #c3e88d;
}
```

---

## Usage

* After installation, your mobile battery status will appear in Waybar.
* Click the module to ping your device via KDE Connect.

---

## Notes

* Make sure KDE Connect is installed and your device is paired.
* Tested with Waybar on Linux with KDE Connect enabled.

---

## Support

If you find this script useful, give it a ⭐ on GitHub!

```

---
