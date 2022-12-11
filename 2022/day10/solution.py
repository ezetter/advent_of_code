f = open("data/p.txt", "r")

acc = 1
cycles = []
for op in (line.strip().split(" ") for line in f):
    if op[0] == "noop":
        cycles.append(acc)
    else:
        cycles.append(acc)
        cycles.append(acc)
        acc += int(op[1])

for i in range(len(cycles)):
    pos = i%40
    if pos == 0:
        print()
    if pos >= cycles[i]-1 and pos <= cycles[i]+1:
        print('#', end='')
    else:
        print('.', end='')
    
print()
