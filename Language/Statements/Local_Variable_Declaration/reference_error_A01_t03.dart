// Copyright (c) 2023 the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if a local variable is referenced at a
/// source code location that is before the end of its initializing expression,
/// if any, and otherwise before the declaring occurrence of the identifier
/// which names the variable.
///
/// @description Checks that it is not an error if a local variable is
/// referenced at a source code location that is after the end of its
/// initializing expression
/// @author sgrekhov22@gmail.com

import '../../../Utils/expect.dart';

main() {
  var x1 = 1, y1 = x1;
  int x2 = 2, y2 = x2;
  final x3 = 3, y3 = x3;
  final int x4 = 4, y4 = x4;
  late final int x5 = 5, y5 = x5;
  late int x6 = 6, y6 = x6;
  late final x7 = 7, y7 = x7;
  late var x8 = 8, y8 = x8;

  Expect.equals(1, y1);
  Expect.equals(2, y2);
  Expect.equals(3, y3);
  Expect.equals(4, y4);
  Expect.equals(5, y5);
  Expect.equals(6, y6);
  Expect.equals(7, y7);
  Expect.equals(8, y8);
}
