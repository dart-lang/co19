// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A local declaration whose name is `_` does not bind that name to
/// anything. This means you can have multiple local declarations named `_` in
/// the same namespace without a collision error. The initializer, if there is
/// one, is still executed, but the value is not accessible.
///
/// @description Checks that an initializer is executed for for-loop variables
/// declarations named `_`
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=wildcard-variables

import '../../Utils/expect.dart';

String _log = "";

int init(int val) {
  _log += "init($val);";
  return val;
}

main() {
  for (int _ = init(1);;) {
    break;
  }
  Expect.equals("init(1);", _log);
  _log = "";

  for (int _ = init(2), _ = init(3);;) {
    break;
  }
  Expect.equals("init(2);init(3);", _log);
}
