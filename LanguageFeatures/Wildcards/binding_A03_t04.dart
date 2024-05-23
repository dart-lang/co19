// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A local declaration whose name is `_` does not bind that name to
/// anything. This means you can have multiple local declarations named `_` in
/// the same namespace without a collision error. The initializer, if there is
/// one, is still executed, but the value is not accessible.
///
/// @description Checks that an initializer is executed for local variable
/// declarations named `_` Test patterns.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=wildcard-variables

import '../../Utils/expect.dart';

String _log = "";

int init(int val) {
  _log = "init($val);";
  return val;
}

class C {
  int a;
  C(this.a);
}

main() {
  var (_) = (init(1));
  Expect.equals("init(1);", _log);

  final [_] = [init(2)];
  Expect.equals("init(2);", _log);

  var {"key1": _} = {"key1": init(3)};
  Expect.equals("init(3);", _log);

  var (_,) = (init(4),);
  Expect.equals("init(4);", _log);

  var C(a: _) = C(init(5));
  Expect.equals("init(5);", _log);
}
