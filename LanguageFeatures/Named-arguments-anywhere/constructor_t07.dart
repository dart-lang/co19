// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Since named arguments are distinguishable from positional ones,
/// allowing named arguments to be placed anywhere in the argument list can be
/// done without changing calling semantics.
///
/// @description Checks that named arguments may be placed anywhere in the
/// argument list. Test constructors
/// @author sgrekhov@unipro.ru

import "../../Utils/expect.dart";

class A {
  String log = "";

  A(int x, int y, {int z = 42}) {
    log = "x=$x, y=$y, z=$z";
  }
}

class C extends A {
  C.named1(int x, int y, int z) : super(x, y, z: z);
  C.named2(int x, int y, int z) : super(x, z: z, y);
  C.named3(int x, int y, int z) : super(z: z, x, y);
}

main() {
  Expect.equals("x=1, y=2, z=3", C.named1(1, 2, 3).log);
  Expect.equals("x=1, y=2, z=3", C.named2(1, 2, 3).log);
  Expect.equals("x=1, y=2, z=3", C.named3(1, 2, 3).log);
}
