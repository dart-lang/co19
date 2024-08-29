// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// A simple identifier in any context named _ is treated as a wildcard variable
/// pattern.
///
/// @description Checks that a simple identifier in an assignment context named
/// `_` is treated as a wildcard variable pattern.
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";
import "patterns_lib.dart";

int _ = 0;

main() {
  int a = 0;
  String s = "";

  (_) = 42;
  Expect.equals(0, _);

  [a, _] = [1, 2];
  Expect.equals(0, _);

  {"key1": _}  = {"key1": 1};
  Expect.equals(0, _);

  (_, name: s) = (1, name: "one");
  Expect.equals(0, _);

  (a, name: _) = (1, name: "one");
  Expect.equals(0, _);

  Square(areaAsInt: _) = Square(2);
  Expect.equals(0, _);
}
