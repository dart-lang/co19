// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If the type alias is not instantiated, then it's a function from
/// types to types, not an alias for a single type, and tearing off a
/// constructor works equivalently to tearing off a corresponding generic
/// function where the generics match the type alias, not the underlying class.
/// The result is a compile-time constant.
///
/// @description Checks that the result of the not instantiated type alias
/// tearing off is a compile-time constant.
///
/// @author iarkh@unipro.ru

// SharedOptions=--enable-experiment=constructor-tearoffs

import "../../Utils/expect.dart";

typedef IntList = List;

main() {
  var v1 = IntList.filled;
  const v2 = IntList.filled;
  const v3 = IntList.filled;

  Expect.identical(v1, v2);
  const CheckIdentical(v2, v3);
}
