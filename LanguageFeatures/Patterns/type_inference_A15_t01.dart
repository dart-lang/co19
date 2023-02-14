// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Calculate the static type of the pattern. Using that value type,
/// recurse through the pattern again downwards to the leaf subpatterns filling
/// in any missing types in the pattern. This process may also insert implicit
/// coercions and casts from dynamic when values flow into a pattern during
/// matching.
///
/// @description Check the static type of a cast pattern. Test that
/// missing types in a type schema are filled in from the initializing
/// expression
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";
import "../../Utils/static_type_helper.dart";

main() {
  var (v1 as double) = 3.14;
  Expect.equals(3.14, v1);
  v1.expectStaticType<Exactly<double>>();

  final (v2 as String) = "42";
  Expect.equals("42", v2);
  v1.expectStaticType<Exactly<double>>();

  Expect.throws((){
    var (num v3 as double) = "42";
    v3.expectStaticType<Exactly<num>>();
  });

  Expect.throws(() {
    final (num v4 as double) = "42";
    v4.expectStaticType<Exactly<num>>();
  });
}
