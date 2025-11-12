

# 🧠 Kaspa Mining Auto-Tune Script (Hive OS)

A fully automated fine-tuning script for **Kaspa (kHeavyHash)** that optimizes NVIDIA RTX GPUs on Hive OS or Linux mining rigs.
It benchmarks multiple overclock combinations, measures efficiency (MH/W), and applies the best-performing settings automatically.

---

## 🚀 Features

✅ **Auto GPU Detection** – works with mixed rigs

✅ **Model-Specific OC Ranges** – safe and efficient tuning

✅ **Automatic Efficiency Optimization** – finds the best MH/W

✅ **CSV Logging** – full performance data

✅ **Applies Best Settings** – automatically after testing

✅ **Works for RTX 20xx, 30xx, and 40xx** cards

---

## ⚙️ Installation

### 1️⃣ SSH into your rig

```bash
ssh user@<rig-ip>
```

### 2️⃣ Clone this repository

```bash
git clone https://github.com/SaithanaSriCharan/Kaspa-Mining-Autotune-Script.git
cd Kaspa-Mining-Autotune-Script
```

### 3️⃣ Make the script executable

```bash
chmod +x kaspa_autotune_universal.sh
```

### 4️⃣ Run the tuner

```bash
./kaspa_autotune_universal.sh
```

---

## 📊 Output Files

| File                         | Description                                        |
| ---------------------------- | -------------------------------------------------- |
| `kaspa_autotune_results.csv` | All test results (core, PL, hashrate, power, MH/W) |
| `kaspa_best.txt`             | Best OC combo per GPU model                        |
| Console Output               | Live tuning progress & status                      |

---

## 🧩 Supported GPUs

| Generation | Supported Models                |
| ---------- | ------------------------------- |
| RTX 20xx   | 2060, 2070, 2080, 2080 Ti       |
| RTX 30xx   | 3060, 3060 Ti, 3070, 3080, 3090 |
| RTX 40xx   | 4060, 4070, 4080, 4090          |

---

## 🧠 How It Works

1. Detects all GPUs via `nvidia-smi`
2. Assigns safe core and power ranges based on model
3. Tests multiple combinations
4. Monitors hashrate & power usage
5. Calculates MH/W efficiency
6. Logs results
7. Picks and applies the most efficient OC settings

---

## ⚡ Hive OS Integration (Optional)

You can automate this in Hive OS:

1. Go to your rig → **Custom Script** tab
2. Add path `/home/user/Kaspa-Mining-Autotune-Script/kaspa_autotune_universal.sh`
3. Set to run weekly or monthly
4. It will automatically fine-tune and apply optimal OCs

---

## 🪙 Example Output

```
🏆 Best 3060 Ti → Core 1560, PL 70W, 480 MH/s, 100W, 4.8 MH/W
🏆 Best 2080    → Core 1660, PL 105W, 460 MH/s, 130W, 3.5 MH/W
```

---

## 🧩 Repository Structure

```
Kaspa-Mining-Autotune-Script/
│
├── kaspa_autotune_universal.sh   # main auto-tuner script
├── README.md                     # documentation (this file)
└── LICENSE                       # optional (MIT recommended)
```

---

## 🧰 Contributing

1. Fork this repository
2. Create your feature branch:

   ```bash
   git checkout -b feature/new-tune
   ```
3. Commit your changes
4. Push to your fork
5. Submit a pull request 🎯

