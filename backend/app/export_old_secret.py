import sys
import csv
from io import StringIO
from .main import secret_index, POKEDEX

if __name__ == "__main__":
    f = StringIO()
    writer = csv.writer(f)
    writer.writerow(["puzzle_number", "name"])
    for puzzle_number in range(1, int(sys.argv[1]) + 1):
        index = secret_index(puzzle_number)
        writer.writerow([puzzle_number, POKEDEX["name"].values[index]])
    print(f.getvalue())
