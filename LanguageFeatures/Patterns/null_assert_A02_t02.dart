// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion nullAssertPattern ::= primaryPattern '!'
///
/// A null-assert pattern is similar to a null-check pattern in that it permits
/// non-null values to flow through. But a null-assert throws if the matched
/// value is null. It lets you forcibly assert that you know a value shouldn't
/// be null, much like the corresponding ! null-assert expression.
///
/// @description Check that null-assert throws if the matched value is null
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";

test(List<String?> list) {
  Expect.throws(() {
    switch (list) {
      case ['name', var name!]:
      break;
      default:
    }
  });
}

main() {
  test(['name', null]);
}
