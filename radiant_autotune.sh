#!/bin/bash
# ============================================================
#  Radiant Auto-Tune Script
#  Coin: Radiant (RXD)
#  Algorithm: Sha512/256d
#  Miner: SRBMiner
# ============================================================

LOG_FILE="radiant_autotune_results.csv"
BEST_FILE="radiant_best.txt"

echo "GPU Model,Core Clock (MHz),Power Limit (W),Hashrate (MH/s),Power Draw (W),Efficiency (MH/W)" > "$LOG_FILE"
echo "Radiant Auto-Tune started at $(date)"
echo "------------------------------------------------------------"

GPUS=$(nvidia-smi --query-gpu=index,name --format=csv,noheader)

benchmark_gpu() {
    GPU_INDEX=$1
    GPU_NAME=$2
    CORE_CLOCK=$3
    POWER_LIMIT=$4

    nvidia-smi -i $GPU_INDEX -pl $POWER_LIMIT
    nvidia-settings -a "[gpu:${GPU_INDEX}]/GPUGraphicsClockOffset[3]=${CORE_CLOCK}" >/dev/null 2>&1

    echo "⏱️  Benchmarking GPU $GPU_INDEX ($GPU_NAME) @ Core ${CORE_CLOCK}, PL ${POWER_LIMIT}"

    HASHRATE=$(timeout 45s SRBMiner-MULTI --algorithm sha512_256d --benchmark 2>/dev/null | grep "H/s" | tail -n 1 | awk '{print $3}')
    HASHRATE=$(echo "scale=2; $HASHRATE/1000000" | bc)
    POWER_DRAW=$(nvidia-smi -i $GPU_INDEX --query-gpu=power.draw --format=csv,noheader,nounits | awk '{print int($1)}')
    EFFICIENCY=$(echo "scale=2; $HASHRATE / $POWER_DRAW" | bc)

    echo "$GPU_NAME,$CORE_CLOCK,$POWER_LIMIT,$HASHRATE,$POWER_DRAW,$EFFICIENCY" >> "$LOG_FILE"
    echo "✅ $GPU_NAME → $HASHRATE MH/s @ ${POWER_DRAW}W = ${EFFICIENCY} MH/W"
}

declare -A CORE_RANGES
declare -A POWER_RANGES
CORE_RANGES["3060 Ti"]="1200 1300 1400 1500 1600"
POWER_RANGES["3060 Ti"]="90 100 110 120"
CORE_RANGES["2080"]="1400 1500 1600 1700"
POWER_RANGES["2080"]="100 110 120 130"

while IFS=',' read -r GPU_INDEX GPU_NAME; do
    echo "🔍 Tuning GPU $GPU_INDEX: $GPU_NAME"
    MODEL_KEY="unknown"

    if [[ $GPU_NAME == *"3060 Ti"* ]]; then
        MODEL_KEY="3060 Ti"
    elif [[ $GPU_NAME == *"2080"* ]]; then
        MODEL_KEY="2080"
    fi

    for CORE in ${CORE_RANGES["$MODEL_KEY"]}; do
        for PL in ${POWER_RANGES["$MODEL_KEY"]}; do
            benchmark_gpu "$GPU_INDEX" "$GPU_NAME" "$CORE" "$PL"
        done
    done
done <<< "$GPUS"

echo "" > "$BEST_FILE"
echo "🏆 Best Settings (Radiant)" >> "$BEST_FILE"
echo "========================" >> "$BEST_FILE"

awk -F',' '
NR>1 {
  model=$1;
  if (eff[model] < $6) {
    eff[model]=$6;
    best[model]=$0;
  }
}
END {
  for (m in best) print m ": " best[m];
}' "$LOG_FILE" >> "$BEST_FILE"
