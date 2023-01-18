// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// A simple identifier in any context named _ is treated as a wildcard variable
/// pattern.
///
/// @description Checks that a simple identifier in a declaration context named
/// _ is treated as a wildcard variable pattern.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "../../Utils/expect.dart";
import "patterns_lib.dart";

int _ = 0;

main() {
  var (_) = 42;
  Expect.equals(0, _);

  final (int _) = 42;
  Expect.equals(0, _);

  var [x1, _] = [1, 2];
  Expect.equals(0, _);

  final {"key1": int _}  = {"key1": 1};
  Expect.equals(0, _);

  var (_, name: String x2) = (1, name: "one");
  Expect.equals(0, _);

  final (int x3, name: _) = (1, name: "one");
  Expect.equals(0, _);

  var Square(areaAsInt: _) = Square(2);
  Expect.equals(0, _);
}
