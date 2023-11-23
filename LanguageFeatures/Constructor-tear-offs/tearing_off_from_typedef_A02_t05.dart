// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion In general, a non-generic type alias is just expanded to its
/// aliased type, then the tear-off happens on that type. Tearing off
/// [IntList.filled] will act like tearing off [List<int>.filled], it
/// automatically instantiates the class type parameter to the specified type.
///
/// @description Checks that tearing-off automatically instantiates the class
/// type parameter to the specified type for non-generic type alias. Test
/// negative dynamic case for [List<int>].
/// @author iarkh@unipro.ru

import "../../Utils/expect.dart";

typedef MyList = List<int>;

dynamic d = 1.1;
dynamic str = "123";

main() {
  var v = MyList.filled;

  Expect.throws(() { v(2, d); });
  Expect.throws(() { v(10, [] as dynamic); });
  Expect.throws(() { v(3, str); });
}
