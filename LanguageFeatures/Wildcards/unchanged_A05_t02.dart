// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Other declarations: top-level variables, top-level function
/// names, type names, member names, etc. are unchanged. They can be named `_`
/// as they are today.
///
/// @description Checks that a member named `_` is still accessible and its
/// value can be used. Test mixin members
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=wildcard-variables

import '../../Utils/expect.dart';

mixin M1 {
  static int _ = 1;
}

mixin M2 {
  static int _() => 2;
}

mixin M3 {
  static int get _ => 3;
}

mixin M4 {
  static void set _(int v) {}
}

mixin M5 {
  int _ = 5;
}

mixin M6 {
  int _() => 6;
}

mixin M7 {
  int get _ => 7;
}

mixin M8 {
  void set _(int v) {}
}

class MA5 = Object with M5;
class MA6 = Object with M6;
class MA7 = Object with M7;
class MA8 = Object with M8;

main() {
  Expect.equals(1, M1._);
  Expect.equals(2, M2._());
  Expect.equals(3, M3._);
  M4._ = 42;
  Expect.equals(5, MA5()._);
  Expect.equals(6, MA6()._());
  Expect.equals(7, MA7()._);
  MA8()._ = 42;
}
