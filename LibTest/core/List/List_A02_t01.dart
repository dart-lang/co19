// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion factory List([int length])
/// It is an error if length is not a non-negative integer.
/// @description Checks that ArgumentError is thrown as expected.
/// @author vasya

import "../../../Utils/expect.dart";

main() {
  try {
    List a = new List.filled(-1, 0);
    Expect.fail("ArgumentError is expected");
  } on ArgumentError catch(e) {}
}
