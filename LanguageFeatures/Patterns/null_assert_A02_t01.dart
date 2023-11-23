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

test1((int?, int?) position) {
  Expect.throws(() {
    var (x!, y!) = position;
  });
  Expect.throws(() {
    var (_!, _!) = position;
  });
}

test2(({int? x, int? y}) position) {
  Expect.throws(() {
    var (x: x!, y: y!) = position;
  });
  Expect.throws(() {
    var (x: _!, y: _!) = position;
  });
}

main() {
  test1((1, null));
  test1((null, 1));
  test1((null, null));
  test2((x: 1, y: null));
  test2((x: null, y: 1));
  test2((x: null, y: null));
}
