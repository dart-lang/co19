// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A local declaration whose name is `_` does not bind that name to
/// anything. This means you can have multiple local declarations named `_` in
/// the same namespace without a collision error. The initializer, if there is
/// one, is still executed, but the value is not accessible.
///
/// @description Checks that for late local variable declarations named `_`
/// initializer is not executed
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=wildcard-variables

import '../../Utils/expect.dart';

String _log = "";

int init(int val) {
  _log = "init($val);";
  return val;
}

test1() {
  late var _ = init(1);
}

test2() {
  late final _ = init(2);
}

test3() {
  late int _ = init(3);
}

main() {
  test1();
  Expect.equals("", _log);
  test2();
  Expect.equals("", _log);
  test3();
  Expect.equals("", _log);
}
