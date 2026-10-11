#!/system/bin/sh
until [ "$(getprop sys.boot_completed)" = "1" ]; do
  sleep 2
done

sleep 5

# 1. Mode Global: Otomatis terapkan ANGLE (Vulkan) ke SEMUA Game & App
settings put global angle_gl_driver_all_angle 1
settings put global updatable_driver_all_apps 1

# 2. Whitelist Spesifik Game Populer (Memastikan game kompetitif 100% dipaksa ke Vulkan)
GAMES="com.tencent.ig,com.mobile.legends,com.pubg.krmobile,com.vng.pubgmobile,com.rekoo.pubgm,com.pubg.imobile,com.tencent.tmgp.pubgmhd,com.vng.mlbbvn,com.garena.game.codm,com.dts.freefireth,com.dts.freefiremax,com.riotgames.league.wildrift,com.ea.gp.fifamobile,com.activision.callofduty.warzone"
ANGLES="angle,angle,angle,angle,angle,angle,angle,angle,angle,angle,angle,angle,angle,angle"

settings put global angle_gl_driver_selection_pkgs "$GAMES"
settings put global angle_gl_driver_selection_values "$ANGLES"
settings put global angle_enabled_packages "$GAMES"

# 3. Dynamic Auto-Detector Loop di latar belakang untuk Game Baru
while true; do
  sleep 60
  # Ambil daftar package app kategori GAME dari PackageManager
  GAME_LIST=$(pm list packages -e | grep -v "com.android" | tr "\n" "," | sed "s/package://g" | sed "s/,$//")
  CURRENT_SEL=$(settings get global angle_gl_driver_selection_pkgs)
  if [ "$GAME_LIST" != "$CURRENT_SEL" ]; then
    settings put global angle_gl_driver_all_angle 1
  fi
done &
