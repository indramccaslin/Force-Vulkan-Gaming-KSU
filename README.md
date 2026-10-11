# Force Vulkan Gaming Engine (ANGLE & SkiaVK)

![Version](https://img.shields.io/badge/version-v1.0-blue)
![Platform](https://img.shields.io/badge/platform-Android-green)
![KernelSU](https://img.shields.io/badge/KernelSU-Module-orange)
![License](https://img.shields.io/badge/license-MIT-lightgrey)

> A KernelSU module that forces OpenGL games to run through the **Vulkan** backend via Google ANGLE engine + Freedreno Turnip driver for better GPU performance and smoother gameplay.

---

## 📌 Description

**Force Vulkan Gaming Engine** is a KernelSU module designed to translate OpenGL ES API calls directly into Vulkan backend using:

- **Google ANGLE** (Almost Native Graphics Layer Engine) — translates OpenGL → Vulkan
- **SkiaVK** — forces Skia renderer to use Vulkan pipeline
- **Freedreno Turnip Driver** — open-source Vulkan driver for Adreno GPUs

This module automatically applies ANGLE/Vulkan translation globally to **all apps and games** on your Android device, while also specifically whitelisting the most popular competitive games to ensure 100% forced Vulkan rendering.

---

## ✨ Features

- ✅ **Global ANGLE Mode** — Automatically applies Vulkan translation to all games & apps
- ✅ **Specific Game Whitelist** — Ensures competitive games are forcefully pushed to Vulkan
- ✅ **Dynamic Auto-Detector** — Background loop that detects newly installed games every 60 seconds
- ✅ **Skia Vulkan Rendering** — Forces system UI and render engine to use Vulkan pipeline
- ✅ **SurfaceFlinger Vulkan Pipe** — Optimizes display rendering through Vulkan

---

## 🎮 Supported Games

| Game | Package |
|------|---------|
| PUBG Mobile (Global) | `com.tencent.ig` |
| PUBG Mobile (KR) | `com.pubg.krmobile` |
| PUBG Mobile (VNG) | `com.vng.pubgmobile` |
| PUBG Mobile (HD) | `com.tencent.tmgp.pubgmhd` |
| Mobile Legends: Bang Bang | `com.mobile.legends` |
| MLBB (VNG) | `com.vng.mlbbvn` |
| Call of Duty: Mobile | `com.garena.game.codm` |
| Free Fire | `com.dts.freefireth` |
| Free Fire MAX | `com.dts.freefiremax` |
| Wild Rift | `com.riotgames.league.wildrift` |
| FIFA Mobile | `com.ea.gp.fifamobile` |
| Warzone Mobile | `com.activision.callofduty.warzone` |

---

## ⚙️ System Properties Applied

```properties
# Force Skia Vulkan Rendering Engine
debug.hwui.renderer=skiavk
debug.renderengine.backend=vulkan
ro.gfx.angle.supported=true
debug.angle.backend=2

# SurfaceFlinger Vulkan Pipe
renderthread.skia.reduceopstasksplitting=true
```

---

## 📋 Requirements

- Android **10+** (API 29+)
- **KernelSU** installed and active
- Adreno GPU (recommended for Freedreno Turnip driver)
- Device with **Vulkan 1.1+** support

---

## 📥 Installation

1. Download the latest `Force-Vulkan-Gaming-KSU.zip` from [Releases](../../releases)
2. Open **KernelSU Manager** app
3. Tap **Install** → select the downloaded ZIP file
4. Reboot your device
5. Done! The module will auto-apply on every boot

---

## 🔧 How It Works

```
Boot Completed
      ↓
service.sh runs
      ↓
Apply ANGLE globally → settings put global angle_gl_driver_all_angle 1
      ↓
Whitelist popular games → force ANGLE/Vulkan per package
      ↓
Background loop (every 60s) → detect new games → re-apply ANGLE
```

---

## ⚠️ Disclaimer

- This module modifies system rendering settings. Use at your own risk.
- Some devices or games may not be compatible with ANGLE/Vulkan translation.
- Always backup your data before installing any KernelSU module.

---

## 👤 Author

**Antigravity**

---

## 📄 License

This project is licensed under the MIT License.
