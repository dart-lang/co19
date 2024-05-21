// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Other declarations: top-level variables, top-level function
/// names, type names, member names, etc. are unchanged. They can be named `_`
/// as they are today.
///
/// @description Checks that it is no warning to declare a late mixin variable
/// named `_`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=wildcard-variables

import '../../Utils/expect.dart';

String _log = "";

int init(int val) {
  _log = "init($val);";
  return val;
}

mixin M1 {
  late int _ = init(1);
}

mixin M2 {
  late final int _ = init(2);
}

mixin M3 {
  static late int _ = init(3);
}

mixin M4 {
  static late final int _ = init(4);
}

class MA1 = Object with M1;
class MA2 = Object with M2;

main() {
  MA1 m1 = MA1();
  Expect.equals("", _log);
  Expect.equals(1, m1._);
  Expect.equals("init(1);", _log);
  _log = "";

  MA2 m2 = MA2();
  Expect.equals("", _log);
  Expect.equals(2, m2._);
  Expect.equals("init(2);", _log);
  _log = "";

  Expect.equals(3, M3._);
  Expect.equals("init(3);", _log);
  _log = "";

  Expect.equals(4, M4._);
  Expect.equals("init(4);", _log);
}
