// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Calculate the static type of the pattern. Using that value type,
/// recurse through the pattern again downwards to the leaf subpatterns filling
/// in any missing types in the pattern. This process may also insert implicit
/// coercions and casts from dynamic when values flow into a pattern during
/// matching.
///
/// @description Check that the calculation of the static type of a map pattern
/// performs casts from dynamic and generic function instantiation
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";
import "../../Utils/static_type_helper.dart";

T foo<T>(T t) => t;

main() {
  dynamic pi = 3.14;
  final <String, double>{"key1": x1} = <String, double>{"key1": pi};
  x1.expectStaticType<Exactly<double>>();
  Expect.equals(3.14, x1);

  var {"key1": double x2} = <String, double>{"key1": pi};
  x2.expectStaticType<Exactly<double>>();
  Expect.equals(3.14, x1);

  Expect.throws(() {
    var <String, int>{"key1": x3} = <String, int>{"key1": pi};
  });

  Map<String, int Function(int)> map = {"key1": foo};
  final <String, int Function(int)>{"key1": x4} = map;
  x4.expectStaticType<Exactly<int Function(int)>>();
}
