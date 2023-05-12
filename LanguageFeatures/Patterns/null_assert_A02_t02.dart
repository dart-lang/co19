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

import "../../Utils/expect.dart";

test1(List<String?> list) {
  Expect.throws(() {
    switch (list) {
      case ['name', var name!]:
        break;
      case ['value', _!]:
        break;
      default:
    }
  });
}

test2(List<String?> list) {
  Expect.throws(() {
    if (list case ['name', var name!]) {}
    if (list case ['value', _!]) {}
  });
}

test3(List<String?> list) {
  Expect.throws(() {
    var x = switch (list) {
      ['name', var name!] => 1,
      ['value', _!] => 2,
      _ => 3
    };
  });
}

main() {
  test1(['name', null]);
  test1(['value', null]);
  test2(['name', null]);
  test2(['value', null]);
  test3(['name', null]);
  test3(['value', null]);
}
