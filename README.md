# 🔄 Flip the L

![Godot Engine](https://shields.io)
![GDScript](https://shields.io)
![Platform](https://shields.io)
![Theme](https://shields.io)

> **"Turn every setback into your strongest comeback."**  
> You have no weapons—only your timing. Absorb incoming losses, flip them into wins, and blast them straight back at your enemies!

### 🎮 [Play Now in Your Browser on itch.io →](https://harjotsingh00.itch.io/flip-the-l)

---

## 📖 About the Game

Built around the **"Bounce Back"** theme in **Godot 4**, **Flip the L** turns the phrase *"taking an L"* into a core arcade mechanic:

- 🔴 **The Threat (`L` Projectiles):** Enemies surround the arena and hurl red **L**s (losses) at you. Taking a direct hit costs 1 life.
- 🟡 **The Rebound Window (Gold Ring):** When an incoming **L** enters your focus ring, the ring turns **GOLD**, signaling your counter window.
- 🟢 **The Bounce Back (`W` Counter):** Triggering your counter at the right moment flips the red **L** into a high-speed green **W** (win) aimed at your cursor—destroying enemies on impact while launching you backward out of danger!

---

## 🕹️ Controls

| Action | Input |
| :--- | :--- |
| **Move** | `Arrow Keys` (`↑` `↓` `←` `→`) |
| **Aim** | `Mouse Cursor` |
| **Flip L → W (Bounce Back)** | `Spacebar` or `Left Mouse Click` *(when ring turns GOLD)* |
| **Restart (Game Over)** | `R` |

---

## ✨ Key Features

- ⚡ **Zero-Weapon Rebound Combat:** Pure timing-based counter mechanics where enemy attacks are your only ammunition.
- 🎯 **Dynamic Visual Feedback:** Color-shifting focus ring, real-time aim laser, camera shake, and `CPUParticles2D` explosion bursts.
- 🔊 **Retro Arcade Audio:** Pitch-randomized synth sound effects for flipping projectiles, taking hits, and destroying enemies.
- 🌐 **Cross-Platform Ready:** Exported cleanly for HTML5 WebGL (itch.io) and desktop platforms.

---

## 🗂️ Project Structure

```text
flip-the-l/
├── scenes/
│   ├── main.tscn          # Main arena, enemy spawner, UI & camera shake
│   ├── player.tscn        # Player movement, parry zone & hurtbox
│   └── hazard_l.tscn      # Projectile logic (switches state from L to W)
├── scripts/
│   ├── main.gd
│   ├── player.gd
│   └── hazard_l.gd
└── sounds/
    ├── flip.wav           # Counter / projectile flip SFX
    ├── boom.wav           # Enemy explosion SFX
    └── hurt.wav           # Damage taken SFX
```

---

## 🛠️ How to Run Locally

1. **Clone the repository:**
   ```bash
   git clone https://github.com
   ```
2. Open **Godot Engine 4.x**.
3. Click **Import**, navigate to the cloned folder, and select `project.godot`.
4. Press **`F5`** (or click **Run Project**) to play!

---

## 👤 Author

**Harjot Singh**  
- 🎮 Play on itch.io: [harjotsingh00.itch.io/flip-the-l](https://itch.io)  
- 💻 GitHub: [@Harjotsingh00](https://github.com)
