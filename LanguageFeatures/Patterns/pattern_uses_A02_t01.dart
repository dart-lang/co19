// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// The static type of a switch expression is the least upper bound of the
/// static types of all of the case expressions.
///
/// @description Check that the static type of a switch expression is the least
/// upper bound of the static types of all of the case expressions.
/// @author sgrekhov22@gmail.com

import "../../Utils/static_type_helper.dart";

main () {
  var x = 42;
  var v1 = switch (x) {
    42 => 42,
    _ => 3.14
  };
  v1.expectStaticType<Exactly<num>>();

  var v2 = switch (x) {
    42 => "42",
    _ => false
  };
  v2.expectStaticType<Exactly<Object>>();

  var v3 = switch (x) {
    42 => 42,
    _ => 3.14 as num?
  };
  v3.expectStaticType<Exactly<num?>>();
}
