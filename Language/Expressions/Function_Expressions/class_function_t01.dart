// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The class of a function literal implements the built-in class
/// Function.
/// @description Checks that a function literal implements interface Function.
/// @author msyabro

import '../../../Utils/expect.dart';

main() {
  checkType(checkIs<Function>, true, () {});
  checkType(checkIs<Function>, true, (() => 1));
  checkType(checkIs<Function>, true, ((p1, p2) {}));
  checkType(checkIs<Function>, true, ((p1, [int? p2]) {}));
  checkType(checkIs<Function>, true, ((p1, {int p2: 1}) {}));
}
