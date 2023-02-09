// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Calculate the static type of the pattern. Using that value type,
/// recurse through the pattern again downwards to the leaf subpatterns filling
/// in any missing types in the pattern. This process may also insert implicit
/// coercions and casts from dynamic when values flow into a pattern during
/// matching.
///
/// @description Check a static type of a parenthesized pattern. Test that
/// missing types in a type schema are filled from the initialising expression
/// and implicit coercions and casts from dynamic are performed
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/static_type_helper.dart";
import "../../Utils/expect.dart";

main() {
  (List<double> [v1]) = [42];
  Expect.equals(42.0, v1);

  dynamic pi = 3.14;
  (final double v2) = pi;
  v2.expectStaticType<Exactly<double>>();

  var (v3) = 42;
  v3.expectStaticType<Exactly<int>>();

  final (v4) = [42];
  v4.expectStaticType<Exactly<List<int>>>();
}
