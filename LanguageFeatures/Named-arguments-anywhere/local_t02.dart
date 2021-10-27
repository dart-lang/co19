// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Since named arguments are distinguishable from positional ones,
/// allowing named arguments to be placed anywhere in the argument list can be
/// done without changing calling semantics.
///
/// @description Checks that named arguments may be placed anywhere in the
/// argument list. Test local functions
/// @author sgrekhov@unipro.ru

// SharedOptions=--enable-experiment=named-arguments-anywhere

import "../../Utils/expect.dart";

main() {
  String foo<T>(T x, T y, {T? z}) => "x=$x, y=$y, z=$z";

  Expect.equals("x=1, y=2, z=3", foo(1, 2, z: 3));
  Expect.equals("x=1, y=2, z=3", foo(z: 3, 1, 2));
  Expect.equals("x=1, y=2, z=3", foo(1, z: 3, 2));
  Expect.equals("x=1, y=2, z=3", foo<int>(1, 2, z: 3));
  Expect.equals("x=1, y=2, z=3", foo<int>(z: 3, 1, 2));
  Expect.equals("x=1, y=2, z=3", foo<int>(1, z: 3, 2));
}
