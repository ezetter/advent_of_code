f = open("data/input.txt", "r")
grid = [[int(x) for x in line.strip()] for line in f]

def score(x, y, h, grid, sz):
    s = 0
    score = 1
    for i in range(x+1, sz):
        s += 1
        if grid[y][i] >= h:
            break
    score *= s

    s = 0
    for i in range(x-1, -1, -1):
        s += 1
        if grid[y][i] >= h:
            break
    score *= s

    s = 0
    for i in range(y+1, sz):
        s += 1
        if grid[i][x] >= h:
            break
    score *= s

    s = 0
    for i in range(y-1, -1, -1):
        s += 1
        if grid[i][x] >= h:
            break

    score *= s
    return score


sz = len(grid)

maxs=0
for x in range(sz):
    for y in range(sz):
        s = score(x, y, grid[y][x], grid, sz)
        if s > maxs:
            maxs = s
print(maxs)
