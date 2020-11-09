#### bitset nim module
std::bitset implementation in pure nim, with identical signatures. It also includes the same kind of raw memory layout behavior enabling byte-level casting, just like std::bitset.

```nim
import bitset

var bs:Bitset[210] # 210 bits, or 27 bytes allocated (not all of 27th byte used)

# set a decimal value of 14 in binary
bs[0] = 0 # not necessary
bs[1] = 1
bs[2] = 1
bs[3] = 1

echo bs # 0000...<redacted>...00001110

assert bs.len() == 210
assert sizeof bs == 27
assert bs.bytes[0] == 14
assert bs.count() == 3
assert bs.unsafeAddr == bs.bytes[0].unsafeAddr
```

#### Possible Future Features

Perhaps having more canonical nim-like interface would be nice, like range accessors for setting/getting, and maybe an iterator should be implemented.
