import csv
import random
import os
import sys

NUM_ROWS = 50


COLUMNS = ["Bloger", "Social media", "Subs", "Field"]

def generate_row():
bloggers=["Mellstroy", "litvin", "MrBeast", "evkasup", "IgorSinjak", "Chikulya", "Victoria Bonya", "Lady Diana", "Vlad A4", "Ksenia Sobchak", "Maslennikov", "Buster"]
soc=["Instagram", "Youtube", "TikTok", "Twitch"]
fi=["casino", "sport", "beauty", "fashion", "children", "game", "Interview"]
    return {
        "Bloger": random.choice(bloggers),
        "Social media":random.choice(soc) ,
        "Subs": random.randint(100000,500000000),
        "Field": random.choice(fi),
    }

OUTPUT_DIR = sys.argv[1] if len(sys.argv) > 1 else "/data"
OUTPUT_FILE = os.path.join(OUTPUT_DIR, "data.csv")

os.makedirs(OUTPUT_DIR, exist_ok=True)

rows = [generate_row() for _ in range(NUM_ROWS)]

with open(OUTPUT_FILE, "w", newline="", encoding="utf-8") as f:
    writer = csv.DictWriter(f, fieldnames=COLUMNS)
    writer.writeheader()
    writer.writerows(rows)
