// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A local declaration whose name is `_` does not bind that name to
/// anything. This means you can have multiple local declarations named `_` in
/// the same namespace without a collision error. The initializer, if there is
/// one, is still executed, but the value is not accessible.
///
/// @description Checks that it is a dead code warning in the analyzer to
/// declare late local variable named `_`. Check that at a run time the
/// initializer is not executed.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=wildcard-variables

import '../../Utils/expect.dart';

String _log = "";

int init(int val) {
  _log = "init($val);";
  return val;
}

test1() {
  late var _ = init(1); // Analyzer reports DEAD_CODE here, but this warning is
                        // ignored by the test runner.
}

test2() {
  late final _ = init(2); // The same as the above.
}

test3() {
  late int _ = init(3);  // The same as the above.
}

main() {
  test1();
  Expect.equals("init(1)", _log);
  test2();
  Expect.equals("init(2)", _log);
  test3();
  Expect.equals("init(3)", _log);
}
