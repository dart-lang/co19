// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// The context type schema for a pattern p is:
/// ...
/// Object: The type the object name resolves to
///
/// @description Check that the type schema of an object pattern is a type the
/// object name resolves to
/// @author sgrekhov22@gmail.com

import "../../Utils/static_type_helper.dart";
import "../../Utils/expect.dart";
import "patterns_lib.dart";

main() {
  String log = "";
  var Square(area: v1) = getType(Square(1), (String s) {log += s;});
  Expect.equals("Square<MetricUnits>", log);

  log = "";
  final Square<Centimeter>(area: v2) =
      getType(Square<Centimeter>(1), (String s) {log += s;});
  Expect.equals("Square<Centimeter>", log);
}
