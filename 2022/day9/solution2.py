f = open("data/p.txt", "r")
visits = {(0, 0): True}
pos = [(0, 0) for _ in range(10)]

moves = {
    'R': lambda pos: (pos[0]+1, pos[1]),
    'L': lambda pos: (pos[0]-1, pos[1]),
    'U': lambda pos: (pos[0], pos[1]+1),
    'D': lambda pos: (pos[0], pos[1]-1),
}

def calc_tmove(hp, tp):
    dx = hp[0]-tp[0]
    dy = hp[1]-tp[1]
    d = (dx)**2 + (dy)**2
    if d > 2:
        if dy == 0:
            return (tp[0] + dx//abs(dx), tp[1])
        elif dx == 0:
            return (tp[0], tp[1] + dy//abs(dy))
        else:
            return (tp[0] + dx//abs(dx), tp[1] + dy//abs(dy))
    return tp

for move in (cmd.strip().split(" ") for cmd in f):
    mf = moves[move[0]]
    for i in range(int(move[1])):
        pos[0] = mf(pos[0])
        for i, _ in enumerate(pos[:-1]):
            pos[i+1] = calc_tmove(pos[i], pos[i+1])
        visits[pos[-1]] = True


print(len(visits))
