// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Calculate the static type of the pattern. Using that value type,
/// recurse through the pattern again downwards to the leaf subpatterns filling
/// in any missing types in the pattern. This process may also insert implicit
/// coercions and casts from dynamic when values flow into a pattern during
/// matching.
///
/// @description Check that the calculation of the static type of a list
/// pattern performs implicit coercions
/// @author sgrekhov22@gmail.com

import "../../Utils/static_type_helper.dart";
import "../../Utils/expect.dart";

main() {
  var <double>[x1] = [42];
  x1.expectStaticType<Exactly<double>>();
  Expect.identical(42.0, x1);

  double? x2;
  [x2] = <double>[42];
  x2.expectStaticType<Exactly<double>>();
  Expect.identical(42.0, x2);

  var [x3, ...List<double> r2] = <double>[1, 2, 3];
  x3.expectStaticType<Exactly<double>>();
  Expect.identical(1.0, x3);
  Expect.identical(2.0, r2[0]);
  Expect.identical(3.0, r2[1]);
}
