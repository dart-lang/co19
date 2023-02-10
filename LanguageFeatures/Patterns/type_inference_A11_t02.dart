// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Calculate the static type of the pattern. Using that value type,
/// recurse through the pattern again downwards to the leaf subpatterns filling
/// in any missing types in the pattern. This process may also insert implicit
/// coercions and casts from dynamic when values flow into a pattern during
/// matching.
///
/// @description Check that calculation of a static type of a logical-and
/// pattern inserts implicit coercions and casts from dynamic
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/static_type_helper.dart";
import "../../Utils/expect.dart";

T foo<T>(T t) => t;

main() {
  var ([double v1] && [num v2]) = [42];
  v1.expectStaticType<Exactly<double>>();
  v2.expectStaticType<Exactly<num>>();
  Expect.equals(42.0, v1);
  Expect.equals(42.0, v2);

  dynamic pi = 3.14;
  var ([double v3] && [num v4]) = [pi];
  v3.expectStaticType<Exactly<double>>();
  v4.expectStaticType<Exactly<num>>();
  Expect.equals(3.14, v3);
  Expect.equals(3.14, v4);
}
