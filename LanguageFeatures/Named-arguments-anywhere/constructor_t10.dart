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

// SharedOptions=--enable-experiment=named-arguments-anywhere

import "../../Utils/expect.dart";

class C<T> {
  T x;
  T y;
  T? z;

  C(this.x, this.y, {this.z});

  C.named(this.x, this.y, {this.z});

  @override
  String toString() => "x=$x, y=$y, z=$z";
}

main() {
  Expect.equals("x=1, y=2, z=3", C(1, 2, z: 3).toString());
  Expect.equals("x=1, y=2, z=3", C(z: 3, 1, 2).toString());
  Expect.equals("x=1, y=2, z=3", C(1, z: 3, 2).toString());
  Expect.equals("x=1, y=2, z=3", C.named(1, 2, z: 3).toString());
  Expect.equals("x=1, y=2, z=3", C.named(z: 3, 1, 2).toString());
  Expect.equals("x=1, y=2, z=3", C.named(1, z: 3, 2).toString());

  Expect.equals("x=1, y=2, z=3", C<int>(1, 2, z: 3).toString());
  Expect.equals("x=1, y=2, z=3", C<int>(z: 3, 1, 2).toString());
  Expect.equals("x=1, y=2, z=3", C<int>(1, z: 3, 2).toString());
  Expect.equals("x=1, y=2, z=3", C<int>.named(1, 2, z: 3).toString());
  Expect.equals("x=1, y=2, z=3", C<int>.named(z: 3, 1, 2).toString());
  Expect.equals("x=1, y=2, z=3", C<int>.named(1, z: 3, 2).toString());
}
