### Bytes

print( bytes(4) )
smileyBytes = bytearray('😂', 'utf-8')
print( smileyBytes )

smileyBytes[3] = int('85', 16)
print(smileyBytes.decode('utf-8'))
