// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion int round()
/// Returns this
/// @description Checks that this function returns correct value
/// (expected to return this integer).
/// @author vasya

import "../../../Utils/expect.dart";

main() {
  Expect.equals(0, 0.round());
  Expect.equals(1, 1.round());
  Expect.equals(-1, -1.round());

  Expect.equals(15, 15.round());
  Expect.equals(-15, -15.round());

  Expect.equals(2147483647, 2147483647.round());
  Expect.equals(-4294967295, -4294967295.round());
  Expect.equals(9007199254740991, 9007199254740991.round());
  Expect.equals(-9007199254740991, (-9007199254740991).round());
}
