// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion This differs for a generic type alias. If the type alias is
/// instantiated (implicitly or explicitly), then the result is still the same
/// as tearing off the aliased type directly, and it's constant and
/// canonicalized if the type arguments are constant.
///
/// @description Checks that if type alias is instantiated, the result is the
/// same as tearing off the aliased type directly.
///
/// @author iarkh@unipro.ru

import "../../Utils/expect.dart";

typedef MyList<T extends num> = List<T>;

main() {
  var v1 = MyList<num>.filled;
  List list1 = v1(3, 1.5);
  Expect.listEquals([1.5, 1.5, 1.5], list1);

  var v2 = MyList<int>.filled;
  List list2 = v2(3, 1);
  Expect.listEquals([1, 1, 1], list2);
}
