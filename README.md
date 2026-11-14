# 🔄 FLIP THE L
### Turn Every Setback Into Your Strongest Comeback.

<p align="center">
  <img src="https://img.shields.io/badge/ENGINE-Godot%204-478CBF?style=for-the-badge&logo=godot-engine&logoColor=white" />
  <img src="https://img.shields.io/badge/LANGUAGE-GDScript-355570?style=for-the-badge" />
  <img src="https://img.shields.io/badge/PLATFORM-Web%20%7C%20Desktop-2EA44F?style=for-the-badge" />
  <img src="https://img.shields.io/badge/THEME-BOUNCE%20BACK-FFD700?style=for-the-badge&logoColor=black" />
</p>

<p align="center">
  <strong>They throw L's at you. You turn them into W's.</strong>
  <br/>
  No weapons. No mercy. Just perfect timing.
</p>

<p align="center">
  <a href="https://harjotsingh00.itch.io/flip-the-l">
    <img src="https://img.shields.io/badge/▶%20PLAY%20NOW-itch.io-FA5C5C?style=for-the-badge&logo=itch.io&logoColor=white" />
  </a>
</p>

---

## 🎮 THE GAME

**Flip the L** is a fast-paced, timing-based arcade survival game built with **Godot 4**, inspired by the idea of bouncing back from failure.

Your enemies don't give you weapons. Instead, they bombard you with red projectiles shaped like the letter **L** — representing every loss coming your way.

But here's the twist:

**Every L is an opportunity to create a W.**

Survive the chaos, watch your timing, and turn enemy attacks into devastating counterattacks. The only weapon you need is your ability to bounce back.

---

## ⚡ HOW TO PLAY

### 🔴 01. TAKE THE L

Enemies surround the arena and launch dangerous red **L-shaped projectiles** toward you.

- Getting hit costs you one life.
- Avoid incoming attacks and stay mobile.
- Survive as long as possible.

### 🟡 02. WAIT FOR THE WINDOW

Your focus ring tracks incoming threats.

When an enemy projectile enters your counter range, the ring changes color to **GOLD**.

That's your signal.

Timing is everything. Counter too early or too late, and you'll miss your opportunity.

### 🟢 03. FLIP THE L INTO A W

Hit the counter button at exactly the right moment.

- Transform the incoming red **L** into a powerful green **W**.
- Launch it toward your mouse cursor.
- Destroy enemies with your reflected projectile.
- Get blasted backward by the counter, escaping danger.

**Don't dodge every L. Learn to flip them.**

---

## 🕹️ CONTROLS

| ACTION | INPUT |
|:---|:---|
| Move Up | `↑ Arrow` |
| Move Down | `↓ Arrow` |
| Move Left | `← Arrow` |
| Move Right | `→ Arrow` |
| Aim | `Mouse Cursor` |
| Flip L → W | `SPACEBAR` / `LEFT MOUSE CLICK` |
| Restart After Game Over | `R` |

> 💡 **PRO TIP:** Keep an eye on your focus ring. When it turns gold, that's your counter window. React quickly!

---

## ✨ FEATURES

| FEATURE | DESCRIPTION |
|:---|:---|
| ⚔️ Weaponless Combat | Turn enemy projectiles into your ammunition. |
| 🎯 Precision Parrying | Counter attacks with perfect timing. |
| 🟡 Dynamic Focus Ring | Visual feedback tells you when to strike. |
| 🟢 Projectile Transformation | Flip dangerous red L's into powerful green W's. |
| 💥 Knockback Mechanics | Use counterattacks to launch yourself away from danger. |
| 📸 Camera Shake | Feel the impact of hits and explosions. |
| ✨ Particle Effects | Explosive visual effects powered by `CPUParticles2D`. |
| 🔊 Retro Audio | Pitch-randomized sound effects for satisfying arcade feedback. |
| 🌐 Cross-Platform | Play in your browser or run the desktop version. |

---

## 🧠 THE CORE MECHANIC

The entire game revolves around one simple idea:

<p align="center">
  <strong>LOSS → TIMING → COUNTER → WIN</strong>
</p>

Your enemies provide the ammunition. Your timing determines the outcome.

| PROJECTILE STATE | COLOR | BEHAVIOR |
|:---|:---|:---|
| Incoming L | 🔴 Red | Damages the player on direct impact. |
| Counter Window | 🟡 Gold | Signals that a projectile is within parry range. |
| Reflected W | 🟢 Green | Targets the cursor and destroys enemies on impact. |

---

## 🛠️ BUILT WITH

<p align="left">
  <img src="https://img.shields.io/badge/Godot-Engine-478CBF?style=flat-square&logo=godot-engine&logoColor=white" />
  <img src="https://img.shields.io/badge/GDScript-Code-355570?style=flat-square" />
  <img src="https://img.shields.io/badge/HTML5-Web%20Export-E34F26?style=flat-square&logo=html5&logoColor=white" />
  <img src="https://img.shields.io/badge/itch.io-Game%20Distribution-FA5C5C?style=flat-square&logo=itch.io&logoColor=white" />
</p>

- **Game Engine:** Godot 4.x
- **Programming Language:** GDScript
- **Visual Effects:** `CPUParticles2D`, camera shake, dynamic color transitions
- **Audio:** Custom retro-style sound effects
- **Deployment:** HTML5 Web Export and Desktop

---

## 📂 PROJECT STRUCTURE

```text
flip-the-l/
│
├── scenes/
│   ├── main.tscn           # Main arena, enemy spawner,
│   │                       # UI and camera shake
│   │
│   ├── player.tscn         # Player movement, parry zone
│   │                       # and hurtbox
│   │
│   └── hazard_l.tscn       # L projectile logic and
│                           # L → W transformation
│
├── scripts/
│   ├── main.gd             # Main game management
│   ├── player.gd           # Player controls and parrying
│   └── hazard_l.gd         # Projectile behavior
│
├── sounds/
│   ├── flip.wav            # Counter / flip sound
│   ├── boom.wav            # Enemy explosion sound
│   └── hurt.wav            # Player damage sound
│
└── project.godot           # Godot project configuration
```

---

## 🚀 GETTING STARTED

Want to experience the game locally or explore the source code?

### Prerequisites

- [Godot Engine 4.x](https://godotengine.org/download/)
- Git installed on your machine

### Installation

**1. Clone the repository**

```bash
git clone https://github.com/Harjotsingh00/flip-the-l
```

**2. Navigate into the project**

```bash
cd flip-the-l
```

**3. Open Godot Engine**

Launch Godot 4.x and select **Import Project**.

**4. Import the project**

Navigate to the cloned folder and select:

```text
project.godot
```

**5. Run the game**

Press `F5` or click **Run Project** in the Godot editor.

That's it! You're ready to flip some L's.

---

## 🌍 PLAY ONLINE

Don't want to install anything?

Jump straight into the action and play the browser version on itch.io.

<p align="center">
  <a href="https://harjotsingh00.itch.io/flip-the-l">
    <img src="https://img.shields.io/badge/PLAY%20FLIP%20THE%20L-PLAY%20IN%20BROWSER-FA5C5C?style=for-the-badge&logo=itch.io&logoColor=white" />
  </a>
</p>

---

## 🎨 THE INSPIRATION

### Built Around the "Bounce Back" Theme

Life throws losses at everyone.

Sometimes you get hit. Sometimes things don't go your way. But every setback is an opportunity to come back stronger.

**Flip the L** transforms this mindset into gameplay.

Instead of simply avoiding failure, you use it. Instead of running from incoming attacks, you turn them against the ones who sent them.

The message is simple:

> **"You don't need to avoid every L. Sometimes, you just need to know when to flip it into a W."**

---

## 👨‍💻 DEVELOPER

<p align="center">
  <strong>HARJOT SINGH</strong>
  <br/>
  Indie Game Developer | Godot Enthusiast
  <br/><br/>
  <a href="https://github.com/Harjotsingh00">
    <img src="https://img.shields.io/badge/GitHub-Harjotsingh00-181717?style=for-the-badge&logo=github&logoColor=white" />
  </a>
  <a href="https://harjotsingh00.itch.io/flip-the-l">
    <img src="https://img.shields.io/badge/itch.io-Play%20My%20Game-FA5C5C?style=for-the-badge&logo=itch.io&logoColor=white" />
  </a>
</p>

---

## ⭐ SUPPORT THE PROJECT

If you enjoyed **Flip the L**, consider:

- ⭐ Starring the project on GitHub.
- 🎮 Playing and sharing the game on itch.io.
- 💬 Sharing your feedback and suggestions.
- 🔁 Spreading the word — turn those L's into W's!

---

<p align="center">
  <strong>🔴 TAKE THE HIT. 🟡 FIND THE MOMENT. 🟢 FLIP THE L.</strong>
  <br/><br/>
  <em>Made with ❤️ and Godot 4.</em>
  <br/>
  <strong>Every L has the potential to become a W.</strong>
</p>
