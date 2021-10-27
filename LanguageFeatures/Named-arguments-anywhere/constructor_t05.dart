// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Since named arguments are distinguishable from positional ones,
/// allowing named arguments to be placed anywhere in the argument list can be
/// done without changing calling semantics.
///
/// @description Checks that named arguments may be placed anywhere in the
/// argument list. Test factory constructors
/// @author sgrekhov@unipro.ru

// SharedOptions=--enable-experiment=named-arguments-anywhere

import "../../Utils/expect.dart";

class C {
  String log = "";

  C(int x, int y, int z) {
    log = "x=$x, y=$y, z=$z";
  }

  factory C.f1(int x, int y, {int z = 42}) {
    return new C(x, y, z);
  }

  factory C.f2(int x, int y, {int z}) = D;
}

class D extends C {
  D(int x, int y, {int z = 42}) : super(x, y, z);
}

main() {
  Expect.equals("x=1, y=2, z=3", C.f1(1, 2, z: 3).log);
  Expect.equals("x=1, y=2, z=3", C.f1(z: 3, 1, 2).log);
  Expect.equals("x=1, y=2, z=3", C.f1(1, z: 3, 2).log);
  Expect.equals("x=1, y=2, z=3", C.f2(1, 2, z: 3).log);
  Expect.equals("x=1, y=2, z=3", C.f2(z: 3, 1, 2).log);
  Expect.equals("x=1, y=2, z=3", C.f2(1, z: 3, 2).log);
}
