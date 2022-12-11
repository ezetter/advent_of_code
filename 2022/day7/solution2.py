f = open("data/lg.txt", "r")
c=0
dir_size = {}
lower_dirs = []
for cmd in f:
    cmd = cmd.strip()
    x = cmd.split(" ")
    if x[1] == "cd" and not x[2] == "..":
        c += 1
        lower_dirs.append(c)
        dir_size[c] = 0
    if x[0].isdigit():
        for s in lower_dirs:
            dir_size[s] += int(x[0])
    if x[1] == "cd" and x[2] == "..":
        lower_dirs.pop()
s = 0
for x in dir_size.values():
    if x <= 100000:
        s += x
avail = 70000000-dir_size[1]
print(avail)
print(min(x for x in dir_size.values() if x > 30000000-avail))
