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

class C<T> {
  String log = "";

  C(T x, T y, {T? z}) {
    log = "x=$x, y=$y, z=$z";
  }

  C.named1(T x, T y, T z) : this(x, y, z: z);
  C.named2(T x, T y, T z) : this(x, z: z, y);
  C.named3(T x, T y, T z) : this(z: z, x, y);
}

main() {
  Expect.equals("x=1, y=2, z=3", C<int>(1, 2, z: 3).log);
  Expect.equals("x=1, y=2, z=3", C<int>(z: 3, 1, 2).log);
  Expect.equals("x=1, y=2, z=3", C<int>(1, z: 3, 2).log);
  Expect.equals("x=1, y=2, z=3", C<int>.named1(1, 2, 3).log);
  Expect.equals("x=1, y=2, z=3", C<int>.named2(1, 2, 3).log);
  Expect.equals("x=1, y=2, z=3", C<int>.named3(1, 2, 3).log);
}
