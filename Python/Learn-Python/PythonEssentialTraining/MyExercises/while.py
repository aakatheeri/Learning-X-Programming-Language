from datetime import datetime

# print(datetime.now().second);

wait_until = datetime.now().second + 2

# while datetime.now().second != wait_until:
#     pass

# print(f'We are at {wait_until} seconds!')

while True:
    if datetime.now().second == wait_until:
        print(f'We are at {wait_until} seconds!')
        break
