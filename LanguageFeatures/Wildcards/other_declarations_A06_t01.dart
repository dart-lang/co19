// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Other declarations: top-level variables, top-level function
/// names, type names, member names, etc. are unchanged. They can be named `_`
/// as they are today.
///
/// @description Checks that it is no warning to declare a late class variable
/// named `_`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=wildcard-variables

import '../../Utils/expect.dart';

String _log = "";

int init(int val) {
  _log = "init($val);";
  return val;
}

class C1 {
  late int _ = init(1);
}

class C2 {
  late final int _ = init(2);
}

class C3 {
  static late int _ = init(3);
}

class C4 {
  static late final int _ = init(4);
}

main() {
  C1 c1 = C1();
  Expect.equals("", _log);
  Expect.equals(1, c1._);
  Expect.equals("init(1);", _log);
  _log = "";

  C2 c2 = C2();
  Expect.equals("", _log);
  Expect.equals(2, c2._);
  Expect.equals("init(2);", _log);
  _log = "";

  Expect.equals(3, C3._);
  Expect.equals("init(3);", _log);
  _log = "";

  Expect.equals(4, C4._);
  Expect.equals("init(4);", _log);
}
