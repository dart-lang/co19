// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion This differs for a generic type alias. If the type alias is
/// instantiated (implicitly or explicitly), then the result is still the same
/// as tearing off the aliased type directly, and it's constant and
/// canonicalized if the type arguments are constant.
///
/// @description Checks that the result of generic type alias tearing off is
/// constant and canonicalized when the alias is instantiated.
///
/// @author iarkh@unipro.ru

// SharedOptions=--enable-experiment=constructor-tearoffs

import "../../Utils/expect.dart";

typedef MyList<T extends num> = List<T>;

main() {
  var v1 = MyList<num>.filled;
  var v2 = MyList<num>.filled;
  var v3 = (MyList<num>).filled;

  Expect.identical(v1, v2);
  Expect.identical(v1, v3);

  var v4 = MyList<int>.filled;
  var v5 = MyList<int>.filled;
  var v6 = (MyList<int>).filled;

  Expect.identical(v4, v5);
  Expect.identical(v4, v6);

  Expect.notEquals(v1, v4);
}
