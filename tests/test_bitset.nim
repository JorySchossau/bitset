import unittest

import bitset

var
  b,b2:Bitset[8]
  c:Bitset[16]

test "size":
  assert b.len == 8

test "write [] accessor":
  b.bytes[0] = 0
  b[1] = 1
  assert b.bytes[0] == 2

test "read bit-in-other-byte":
  var d:Bitset[64]
  d[55] = 1
  assert d.bytes[6] == 0b10000000

test "read [] accessor":
  b.bytes[0] = 0
  b[1] = 1
  assert b[1] == 1

test "write set() accessor":
  b.bytes[0] = 0
  b.set()
  assert b.bytes[0] == 255
  b.bytes[0] = 0
  b.set(1,1)
  assert b.bytes[0] == 2

test "equality and inequality":
  b.bytes[0] = 7
  assert b == b
  b2.bytes[0] = 8
  assert b != b2
  b2.bytes[0] = 7
  assert b == b2

test "string conversion":
  b.bytes[0] = 0b00010101
  assert $b == "00010101"

test "reset()":
  c.bytes[0] = 0b01010101
  c.bytes[1] = 0b00001111
  c.reset()
  assert c.bytes[0] + c.bytes[1] == 0

test "reset(i)":
  c.bytes[0] = 0b01010101
  c.bytes[1] = 0b00001111
  c.reset(8)
  assert c.bytes[0] == 0b01010101
  assert c.bytes[1] == 0b00001110

test "len()":
  assert c.len == 16

test "size() (len)":
  assert c.size == 16

test "count()":
  c.reset()
  c.bytes[0] = 0b01010101
  c.bytes[1] = 0b01010000 # 6 bits set across both bytes
  assert c.count == 6

test "any()":
  c.reset()
  c.bytes[1] = 4
  assert c.any
  c.bytes[1] = 0
  assert not c.any

test "none()":
  c.reset()
  c.bytes[1] = 4
  assert not c.none
  c.bytes[1] = 0
  assert c.none

test "test()":
  c.reset()
  c.bytes[0] = 5
  assert c.test(2)
  assert not c.test(1)

test "all()":
  c.reset()
  c.bytes[0] = 255
  c.bytes[1] = 255
  assert c.all
  c.bytes[0] = 1
  assert not c.all

test "flip()":
  b.reset()
  b.bytes[0] = 0b01010101
  b.flip()
  assert b.bytes[0] == 0b10101010
  b.reset()
  b.flip()
  assert b.bytes[0] == 255

test "flip(i)":
  b.reset()
  b.bytes[0] = 0b01010101
  b.flip(2)
  assert b.bytes[0] == 0b01010001
  b.flip(1)
  assert b.bytes[0] == 0b01010011

test "bool op 'or'":
  b.reset()
  b2.reset()
  b.bytes[0]  = 0b00000100
  b2.bytes[0] = 0b00001010
  assert (b or b2).bytes[0] == 0b00001110

test "bool op 'and'":
  b.reset()
  b2.reset()
  b.bytes[0]  = 0b00001101
  b2.bytes[0] = 0b00001011
  assert (b and b2).bytes[0] == 0b00001001

test "bool op 'xor'":
  b.reset()
  b2.reset()
  b.bytes[0]  = 0b00001101
  b2.bytes[0] = 0b00001011
  assert (b xor b2).bytes[0] == 0b00000110

var p: ptr Bitset[8] = create Bitset[8]
var p2: ptr Bitset[8] = create Bitset[8]
var pc:ptr Bitset[16] = create Bitset[16]

test "ptr size":
  assert p.len == 8

test "ptr write [] accessor":
  p.bytes[0] = 0
  p[1] = 1
  assert p.bytes[0] == 2

test "ptr read [] accessor":
  p.bytes[0] = 0
  p[1] = 1
  assert p[1] == 1

test "ptr write set() accessor":
  p.bytes[0] = 0
  p.set()
  assert p.bytes[0] == 255
  p.bytes[0] = 0
  p.set(1,1)
  assert p.bytes[0] == 2

test "ptr equality and inequality":
  p.bytes[0] = 7
  assert p == p
  p2.bytes[0] = 8
  assert p != p2
  p2.bytes[0] = 7
  assert p == p2

test "ptr string conversion":
  p.bytes[0] = 0b00010101
  assert $p == "00010101"

test "ptr reset()":
  pc.bytes[0] = 0b01010101
  pc.bytes[1] = 0b00001111
  pc.reset()
  assert pc.bytes[0] + pc.bytes[1] == 0

test "ptr reset(i)":
  pc.bytes[0] = 0b01010101
  pc.bytes[1] = 0b00001111
  pc.reset(8)
  assert pc.bytes[0] == 0b01010101
  assert pc.bytes[1] == 0b00001110

test "ptr len()":
  assert pc.len == 16

test "ptr size() (len)":
  assert pc.size == 16

test "ptr count()":
  pc.reset()
  pc.bytes[0] = 0b01010101
  pc.bytes[1] = 0b01010000 # 6 bits set across both bytes
  assert pc.count == 6

test "ptr any()":
  pc.reset()
  pc.bytes[1] = 4
  assert c.any
  pc.bytes[1] = 0
  assert not pc.any

test "ptr none()":
  pc.reset()
  pc.bytes[1] = 4
  assert not pc.none
  pc.bytes[1] = 0
  assert pc.none

test "ptr test()":
  pc.reset()
  pc.bytes[0] = 5
  assert pc.test(2)
  assert not pc.test(1)

test "ptr all()":
  pc.reset()
  pc.bytes[0] = 255
  pc.bytes[1] = 255
  assert pc.all
  pc.bytes[0] = 1
  assert not pc.all

test "ptr flip()":
  p.reset()
  p.bytes[0] = 0b01010101
  p.flip()
  assert p.bytes[0] == 0b10101010
  p.reset()
  p.flip()
  assert p.bytes[0] == 255

test "ptr flip(i)":
  p.reset()
  p.bytes[0] = 0b01010101
  p.flip(2)
  assert p.bytes[0] == 0b01010001
  p.flip(1)
  assert p.bytes[0] == 0b01010011

test "ptr bool op 'or'":
  p.reset()
  p2.reset()
  p.bytes[0]  = 0b00000100
  p2.bytes[0] = 0b00001010
  assert (p or p2).bytes[0] == 0b00001110

test "ptr bool op 'and'":
  p.reset()
  p2.reset()
  p.bytes[0]  = 0b00001101
  p2.bytes[0] = 0b00001011
  assert (p and p2).bytes[0] == 0b00001001

test "ptr bool op 'xor'":
  p.reset()
  p2.reset()
  p.bytes[0]  = 0b00001101
  p2.bytes[0] = 0b00001011
  assert (p xor p2).bytes[0] == 0b00000110
