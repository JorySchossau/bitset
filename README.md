#### bitset nim module
std::bitset implementation in pure nim, with identical signatures. It also includes the same kind of raw memory layout behavior enabling byte-level casting, just like std::bitset.

```nim
import bitset

var bs:Bitset[210] # 210 bits, or 27 bytes allocated (not all of 27th byte used)
bs[0] = 0 # not necessary
bs[1] = 1
bs[2] = 1
assert bs.bytes[0] == 6
assert bs.count() == 2
```

#### Possible Future Features

Perhaps having more canonical nim-like interface would be nice, like range accessors for setting/getting, and maybe an iterator should be implemented.
