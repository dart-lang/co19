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
/// @description Check null-assert in a variable pattern
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/static_type_helper.dart";
import "../../Utils/expect.dart";

test1((int?, int?) position) {
  var (x!, y!) = position;
  x.expectStaticType<Exactly<int>>();
  y.expectStaticType<Exactly<int>>();
  x.isOdd;
  y.isOdd;
  Expect.equals(1, x);
  Expect.equals(1, y);
}

test2(({int? x, int? y}) position) {
  var (x: x!, y: y!) = position;
  x.expectStaticType<Exactly<int>>();
  y.expectStaticType<Exactly<int>>();
  x.isOdd;
  y.isOdd;
  Expect.equals(1, x);
  Expect.equals(1, y);
}

main() {
  test1((1, 1));
  test2((x: 1, y: 1));
}
