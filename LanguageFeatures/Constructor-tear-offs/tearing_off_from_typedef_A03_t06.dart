// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion This differs for a generic type alias. If the type alias is
/// instantiated (implicitly or explicitly), then the result is still the same
/// as tearing off the aliased type directly, and it's constant and
/// canonicalized if the type arguments are constant.
///
/// @description Checks that if type alias is instantiated, the result is the
/// same as tearing off the aliased type directly. Test negative runtime cases.
///
/// @author iarkh@unipro.ru

import "../../Utils/expect.dart";

typedef MyList<T extends num> = List<T>;

dynamic d = 3.14;
String s = "";

main() {
  var v = MyList<num>.filled;
  Expect.throws(() { v(2, s); });

  var v1 = MyList<int>.filled;
  Expect.throws(() { v1(7, d); });
  Expect.throws(() { v1(1, s); });
  Expect.throws(() { v1(7, null as dynamic); });
  Expect.throws(() { v1(3, 1.0 as dynamic); });
}
