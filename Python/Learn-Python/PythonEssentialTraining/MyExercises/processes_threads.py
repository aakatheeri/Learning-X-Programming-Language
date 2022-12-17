
## Threads

import threading
import time

# print([longSquare(n) for n in range(0, 5)]);



def longSquare(num, results):
    time.sleep(1)
    results[num] = num**2

results = {}

t1 = threading.Thread(target=longSquare, args=(1,results))

t2 = threading.Thread(target=longSquare, args=(2,results))

t1.start()
t2.start()

t1.join()
t2.join()

print(results)
