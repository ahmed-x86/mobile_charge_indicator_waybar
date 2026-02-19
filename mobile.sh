#!/usr/bin/env bash

# البحث عن أول جهاز متصل تلقائياً
PHONEID=$(kdeconnect-cli -l --id-only | head -n 1)
ICON="" # غيرت الأيقونة لتكون أوضح، يمكنك إعادتها

# التحقق من أن الخدمة تعمل
if ! pgrep -x kdeconnectd > /dev/null; then
    echo "{\"text\": \"$ICON ?\", \"class\": \"critical\", \"tooltip\": \"KDE Connect service not running\"}"
    exit 0
fi

# إذا لم يتم العثور على جهاز
if [ -z "$PHONEID" ]; then
    echo "{\"text\": \"$ICON --\", \"class\": \"critical\", \"tooltip\": \"No device found\"}"
    exit 0
fi

# التحقق من الوصول للجهاز
reachable=$(qdbus org.kde.kdeconnect /modules/kdeconnect/devices/$PHONEID org.kde.kdeconnect.device.isReachable 2>/dev/null)

if [ "$reachable" != "true" ]; then
    echo "{\"text\": \"$ICON \", \"class\": \"warning\", \"tooltip\": \"Device not reachable\"}"
    exit 0
fi

# جلب نسبة البطارية
battery=$(qdbus org.kde.kdeconnect /modules/kdeconnect/devices/$PHONEID/battery org.kde.kdeconnect.device.battery.charge 2>/dev/null)
# جلب حالة الشحن (اختياري للعلم)
is_charging=$(qdbus org.kde.kdeconnect /modules/kdeconnect/devices/$PHONEID/battery org.kde.kdeconnect.device.battery.isCharging 2>/dev/null)

if [ -z "$battery" ]; then
    echo "{\"text\": \"$ICON --%\", \"class\": \"critical\"}"
else
    # تحديد اللون بناءً على النسبة
    if [ "$battery" -le 20 ]; then
        color="critical"
    elif [ "$battery" -le 50 ]; then
        color="warning"
    else
        color="normal"
    fi

    # إضافة علامة صاعقة إذا كان يشحن
    if [ "$is_charging" == "true" ]; then
        INFO="$ICON  $battery%"
    else
        INFO="$ICON $battery%"
    fi

    echo "{\"text\": \"$INFO\", \"class\": \"$color\", \"tooltip\": \"Battery: $battery%\"}"
fi
