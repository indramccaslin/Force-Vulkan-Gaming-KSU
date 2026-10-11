ui_print ""
ui_print "****************************************"
ui_print "*   Force Vulkan Gaming Engine (KSU)   *"
ui_print "*   OpenGL-to-Vulkan via ANGLE + Turnip *"
ui_print "****************************************"
ui_print ""
ui_print "- Memaksa PUBG Mobile & MLBB ke Vulkan"
ui_print "- Mengaktifkan Google ANGLE Vulkan Layer"
ui_print "- Memaksimalkan Driver Freedreno Turnip"
ui_print ""
set_perm_recursive $MODPATH 0 0 0755 0644
set_perm $MODPATH/service.sh 0 0 0755
ui_print "- Selesai! Silakan Reboot Perangkat."
ui_print ""
