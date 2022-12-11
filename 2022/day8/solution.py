f = open("data/input.txt", "r")
grid = [[int(x) for x in line.strip()] for line in f]

sz = len(grid)
vis = {}

for x in range(sz):
    xl = -1
    xr = -1
    yt = -1
    yb = -1
    for y in range(sz):
        if grid[y][x] > xl:
            vis[(y, x)] = True
            xl = grid[y][x]
        if grid[sz-y-1][x] > xr:
            vis[(sz-y-1,x)] = True
            xr = grid[sz-y-1][x]
        if grid[x][y] > yt:
            vis[(x, y)] = True
            yt = grid[x][y]
        if grid[x][sz-y-1] > yb:
            vis[(x, sz-y-1)] = True
            yb = grid[x][sz-y-1]

print(len(vis))
