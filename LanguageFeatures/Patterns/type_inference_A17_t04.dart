// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Calculate the static type of the pattern. Using that value type,
/// recurse through the pattern again downwards to the leaf subpatterns filling
/// in any missing types in the pattern. This process may also insert implicit
/// coercions and casts from dynamic when values flow into a pattern during
/// matching.
///
/// @description Check the calculation static type of a list pattern. Test that
/// missing types in a type schema are filled from the initialising expression
/// and implicit coercions and casts from dynamic are performed. Test the case
/// when non-empty list pattern has context type schema _
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/static_type_helper.dart";

main() {
  var [...r1] = [1, 2, 3];
  r1.expectStaticType<Exactly<List<int>>>();

  final [...r2] = [1, 2, 3.14];
  r2.expectStaticType<Exactly<List<num>>>();

  var [...r3] = [1, 2, "3"];
  r3.expectStaticType<Exactly<List<Object>>>();

  final [...r4] = [1, 2, null];
  r4.expectStaticType<Exactly<List<int?>>>();
}
