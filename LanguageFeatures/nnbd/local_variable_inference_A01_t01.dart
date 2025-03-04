// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Local variables with explicitly written types are given the
/// declared types as written. The declared type of the variable is considered a
/// "type of interest" in the sense defined in the flow analysis specification.
/// If the variable has an initializer (explicit or implicit) and is not final,
/// then the declaration is treated as an assignment for the purposes of
/// promotion.
///
/// @description Checks that if the local variable has an initializer (explicit
/// or implicit) and is not final, then the declaration is treated as an
/// assignment for the purposes of promotion.
///
/// @author sgrekhov@unipro.ru

import "../../Utils/expect.dart";

class C {
  static void testStatic() {
    int? x = 42;
    x.isEven;
    x = null;
    Expect.isNull(x?.isEven);

    int? y;
    Expect.isNull(y?.isEven);
    x = 42;
    x.isEven;

    late int? z = 42;
    z.isEven;
    z = null;
    Expect.isNull(z?.isEven);
  }

  test() {
    int? x = 42;
    x.isEven;
    x = null;
    Expect.isNull(x?.isEven);

    int? y;
    Expect.isNull(y?.isEven);
    x = 42;
    x.isEven;

    late int? z = 42;
    z.isEven;
    z = null;
    Expect.isNull(z?.isEven);
  }
}

main() {
  int? x = 42;
  x.isEven;
  x = null;
  Expect.isNull(x?.isEven);

  int? y;
  Expect.isNull(y?.isEven);
  x = 42;
  x.isEven;

  late int? z = 42;
  z.isEven;
  z = null;
  Expect.isNull(z?.isEven);

  C.testStatic();
  C().test();
}
