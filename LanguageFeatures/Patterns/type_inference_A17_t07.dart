// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Calculate the static type of the pattern. Using that value type,
/// recurse through the pattern again downwards to the leaf subpatterns filling
/// in any missing types in the pattern. This process may also insert implicit
/// coercions and casts from dynamic when values flow into a pattern during
/// matching.
///
/// @description Check that the calculation of the static type of a list pattern
/// performs call insertions
/// @author sgrekhov22@gmail.com

import "../../Utils/static_type_helper.dart";

class C {
  int call(int i) => i;
}

main() {
  List<int Function(int)> list = [C()];
  var <int Function(int)>[v] = list;
  v.expectStaticType<Exactly<int Function(int)>>();
}
