// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If the type alias is not instantiated, then it's a function from
/// types to types, not an alias for a single type, and tearing off a
/// constructor works equivalently to tearing off a corresponding generic
/// function where the generics match the type alias, not the underlying class.
/// The result is a compile-time constant.
///
/// @description Checks that if type alias is not instantiated, tearing off a
/// constructor works equivalently to tearing off a corresponding generic
/// function where the generics match the type alias.
///
/// @author iarkh@unipro.ru

import "../../Utils/expect.dart";

typedef MyList<T> = List<T>;

main() {
  var v = List.filled;
  List list1 = v(3, 1);
  Expect.listEquals([1, 1, 1], list1);

  List list2 = v(4, null);
  Expect.listEquals([null, null, null, null], list2);
}
