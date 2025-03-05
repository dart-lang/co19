// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It's not a compile error to read definitely unassigned local
/// variable in the form var x;
///
/// @description Checks that it's not a compile error to read definitely
/// unassigned local variable in the form var x;. Test indirect read via compound
/// assignment
/// @author sgrekhov@unipro.ru

import "../../Utils/expect.dart";

main() {
  var x1;
  Expect.throws(() { x1 *= 2; });

  var x2;
  Expect.throws(() { x2 /= 2; });

  var x3;
  Expect.throws(() { x3 ~/= 2; });

  var x4;
  Expect.throws(() { x4 %= 2; });

  var x5;
  Expect.throws(() { x5 += 2; });

  var x6;
  Expect.throws(() { x6 -= 2; });

  var x7;
  Expect.throws(() { x7 <<= 2; });

  var x8;
  Expect.throws(() { x8 >>= 2; });

  var x9;
  Expect.throws(() { x1 &= 2; });

  var x10;
  Expect.throws(() { x10 ^= 2; });

  var x11;
  Expect.throws(() { x11 |= 2; });

  var x12;
  x12 ??= 2;
  Expect.equals(2, x12);
}
