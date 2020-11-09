# Package

version       = "0.1.0"
author        = "Jory Schossau"
description   = "A pure nim version of C++'s std::bitset"
license       = "MIT"
srcDir        = "src"


# Dependencies

requires "nim >= 1.5.1"

import oswalkdir, os, strutils

proc runTests(nimFlags = "") =

  for f in oswalkdir.walkDir("tests"):
    # Run all nim modules starting with "t"
    let sf = f.path.splitFile()
    if sf.ext == ".nim" and sf.name.startsWith("t"):
      exec "nim c " & " -r " & nimFlags & " " & f.path

task test, "run tests":
  runTests()
