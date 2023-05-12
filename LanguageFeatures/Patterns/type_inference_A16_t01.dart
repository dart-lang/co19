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
/// missing types in a type schema are filled in from the initializing
/// expression
/// @author sgrekhov22@gmail.com

import "../../Utils/static_type_helper.dart";
import "../../Utils/expect.dart";

main() {
  var (v1) = 42;
  v1.expectStaticType<Exactly<int>>();

  final (v2) = <int>[42];
  v2.expectStaticType<Exactly<List<int>>>();
}
