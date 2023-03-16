// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Calculate the static type of the pattern. Using that value type,
/// recurse through the pattern again downwards to the leaf subpatterns filling
/// in any missing types in the pattern. This process may also insert implicit
/// coercions and casts from dynamic when values flow into a pattern during
/// matching
///
/// @description Check that the calculation of the static type of a record
/// pattern performs casts from dynamic
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "../../Utils/expect.dart";
import "../../Utils/static_type_helper.dart";

main() {
  dynamic pi = 3.14;
  final (double v1, n: double v2) = (pi, n: pi);
  v1.expectStaticType<Exactly<double>>();
  v2.expectStaticType<Exactly<double>>();
  Expect.equals(3.14, v1);
  Expect.equals(3.14, v2);

  Expect.throws(() {
    var (int v3,) = (pi,);
  });
  Expect.throws(() {
    final (n: int v4) = (n: pi);
  });
}
