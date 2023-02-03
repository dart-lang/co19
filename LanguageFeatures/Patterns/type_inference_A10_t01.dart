// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// The context type schema for a pattern p is:
/// ...
/// Object: The type the object name resolves to
///
/// @description Check that the type schema of a record pattern is a type the
/// object name resolves to
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "../../Utils/static_type_helper.dart";
import "patterns_lib.dart";

main() {
  var Square(area: v1) = Square(1);
  v1.expectStaticType<Exactly<Unit<MetricUnits>>>();

  var Square<SI>(area: v2) = Square<Centimeter>(1);
  v2.expectStaticType<Exactly<Unit<SI>>>();

  var Square(area: v3) = Square<Centimeter>(1);
  v3.expectStaticType<Exactly<Unit<Centimeter>>>();
}
