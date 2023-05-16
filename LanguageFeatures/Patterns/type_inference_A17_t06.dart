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
/// performs casts from dynamic and generic function instantiation
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";
import "../../Utils/static_type_helper.dart";

T foo<T>(T t) => t;

main() {
  dynamic pi = 3.14;
  var <double>[v1] = [pi];
  v1.expectStaticType<Exactly<double>>();
  Expect.equals(3.14, v1);

  Expect.throws(() {
    final <int>[v2] = [pi];
  });

  var <double>[...v3] = [pi];
  v3.expectStaticType<Exactly<List<double>>>();
  Expect.listEquals([3.14], v3);

  Expect.throws(() {
    final <int>[...v4] = [pi];
  });

  final [...List<double> v5] = [pi];
  Expect.listEquals([3.14], v5);

  List<int Function(int)> list = [foo];
  var <int Function(int)>[v6] = list;
  v6.expectStaticType<Exactly<int Function(int)>>();
}
