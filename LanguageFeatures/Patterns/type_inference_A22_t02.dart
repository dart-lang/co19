// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// To type check a pattern p being matched against a value of type M:
/// ...
/// Null-check or null-assert:
//
// Let N be NonNull(M).
//
// Type-check the subpattern using N as the matched value type.
///
/// @description Check null-assert pattern in an irrefutable context produces no
/// compile-time errors
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";

main() {
  Expect.throws(() {
    final ((int? y)!) = null;
    y?.isEven;
  });
}
