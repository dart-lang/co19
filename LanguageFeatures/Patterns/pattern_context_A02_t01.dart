// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// In a declaration context, an identifier pattern declares a new variable with
/// that name.
///
/// @description Checks that in a declaration context, an identifier pattern
/// declares a new variable with that name.
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";
import "patterns_lib.dart";

main() {
  var (x1) = 1;
  Expect.equals(1, x1);

  final (x2) = 2;
  Expect.equals(2, x2);

  var (int x3) = 3;
  Expect.equals(3, x3);

  final (int x4) = 4;
  Expect.equals(4, x4);

  var [x5, ...] = [5, 6];
  Expect.equals(5, x5);

  final [x6, ...] = [6, 7];
  Expect.equals(6, x6);

  var [int x7, ...] = [7, 8];
  Expect.equals(7, x7);

  final [int x8, ...] = [8, 9];
  Expect.equals(8, x8);

  var {"key1": x9} = {"key1": 9};
  Expect.equals(9, x9);

  final {"key1": x10} = {"key1": 10};
  Expect.equals(10, x10);

  var {"key1": int x11} = {"key1": 11};
  Expect.equals(11, x11);

  final {"key1": int x12} = {"key1": 12};
  Expect.equals(12, x12);

  var (num x13, n: x14) = (13, n: 14);
  Expect.equals(13, x13);
  Expect.equals(14, x14);

  final (x15, n: int x16) = (15, n: 16);
  Expect.equals(15, x15);
  Expect.equals(16, x16);

  final Square(:areaAsInt) = Square(2);
  Expect.equals(4, areaAsInt);

  var Square(areaAsInt: int x17) = Square(2);
  Expect.equals(4, x17);
}
