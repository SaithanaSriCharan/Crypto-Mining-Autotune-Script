
# ⚡ Crypto Mining Auto-Tune Scripts

### Efficient GPU Overclock & Performance Tuning for Kaspa, Nexa, Radiant, and IronFish

Developed by **[SaithanaSriCharan](https://github.com/SaithanaSriCharan)**
Compatible with **Hive OS / Ubuntu / Debian / Windows (via WSL)**

---

## 🧠 Overview

This repository provides **auto-tuning bash scripts** that help miners automatically find the most efficient overclock (OC) settings for each GPU and coin.
Each script benchmarks a range of core/memory/power settings, logs performance, and helps you determine the best MH/W ratio for stable and profitable mining.

---

## 📁 Repository Structure

```
Crypto-Mining-Autotune-Script/
│
├── README.md
├── kaspa_autotune.sh
├── nexa_autotune.sh
├── radiant_autotune.sh
└── ironfish_autotune.sh
```

---

## ⚙️ Available Auto-Tune Scripts

| Coin         | Algorithm   | Script                 | Recommended Miner | Status  |
| ------------ | ----------- | ---------------------- | ----------------- | ------- |
| **Kaspa**    | kHeavyHash  | `kaspa_autotune.sh`    | lolMiner          | ✅ Ready |
| **Nexa**     | NexaPow     | `nexa_autotune.sh`     | BZMiner           | ✅ Ready |
| **Radiant**  | Sha512/256d | `radiant_autotune.sh`  | SRBMiner          | ✅ Ready |
| **IronFish** | Blake3      | `ironfish_autotune.sh` | lolMiner          | ✅ Ready |

---

## 🔧 How to Use

1️⃣ **Clone the repo**

```bash
git clone https://github.com/SaithanaSriCharan/Crypto-Mining-Autotune-Script.git
cd Crypto-Mining-Autotune-Script
```

2️⃣ **Make the scripts executable**

```bash
chmod +x *.sh
```

3️⃣ **Run a tuning script**

```bash
./kaspa_autotune.sh
```

4️⃣ **View tuning results**
After running, you’ll see a `results.csv` or console summary with:

* Hashrate (MH/s)
* Power Draw (W)
* Efficiency (MH/W)
* Best OC Settings found

---

## 📊 Example Output

```
GPU, CORE, MEM, POWER, HASHRATE(MH/s), POWER(W), EFFICIENCY(MH/W)
GPU0, 1100, 810, 120, 38.5, 118, 0.33
GPU0, 1150, 800, 125, 39.0, 121, 0.32
Best Settings → CORE=1100, MEM=810, POWER=120
```

---

## 🧩 Coming Soon

| Feature                    | Description                                        |
| -------------------------- | -------------------------------------------------- |
| **auto_decision_agent.py** | AI-based agent to auto-select most profitable coin |
| **gpu_monitor.sh**         | Real-time GPU health and temperature tracker       |
| **profit_calculator.sh**   | Estimate daily net profit with electricity cost    |
| **telegram_alerts.sh**     | Send profit updates and switch alerts to Telegram  |

---

## 👨‍💻 Author

**Saithana Sri Charan**
💡 Open-source enthusiast | Crypto mining automation | AI integrations
🔗 [GitHub Profile](https://github.com/SaithanaSriCharan)

---

## ☕ Support My Work

If you like my work and want to support future development —

<a href="https://www.buymeacoffee.com/404CyberBoy" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" alt="Buy Me A Coffee" style="height: 60px !important;width: 217px !important;" ></a>

