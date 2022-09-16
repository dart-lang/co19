// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion With generalized type-aliases, it's possible to declare a
/// class-alias like [typedef IntList = List<int>;]. We allow calling
/// constructors on such a type alias, so we will also allow tearing off such a
/// constructor.
///
/// @description Checks that it's possible to declare [typedef IntList =
/// List<int>;] and filled constructor is teared of in this case.
/// @author iarkh@unipro.ru

import "../../Utils/expect.dart";

typedef IntList = List<int>;

main() {
  IntList list = [1, 2, 3];
  Expect.listEquals([1, 2, 3], list);

  IntList list1 = IntList.filled(3, 2);
  Expect.listEquals([2, 2, 2], list1);

  var v = IntList.filled;
  Expect.listEquals([2, 2, 2], v(3, 2));
}
