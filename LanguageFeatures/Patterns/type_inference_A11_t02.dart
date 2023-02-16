// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Calculate the static type of the pattern. Using that value type,
/// recurse through the pattern again downwards to the leaf subpatterns filling
/// in any missing types in the pattern. This process may also insert implicit
/// coercions and casts from dynamic when values flow into a pattern during
/// matching.
///
/// @description Check that the calculation of the static type of a logical-and
/// pattern inserts implicit coercions
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/static_type_helper.dart";
import "../../Utils/expect.dart";

main() {
  var ([double v1] && [num v2]) = [42];
  v1.expectStaticType<Exactly<double>>();
  v2.expectStaticType<Exactly<num>>();
  Expect.identical(42.0, v1);
  Expect.identical(42.0, v2);
}
