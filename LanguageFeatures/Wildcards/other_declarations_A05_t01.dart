// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Other declarations: top-level variables, top-level function
/// names, type names, member names, etc. are unchanged. They can be named `_`
/// as they are today.
///
/// @description Checks that a member named `_` is still accessible and its
/// value can be used. Test class members
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=wildcard-variables

import '../../Utils/expect.dart';

class C1 {
  static int _ = 1;
}

class C2 {
  static int _() => 2;
}

class C3 {
  static int get _ => 3;
}

class C4 {
  static void set _(int v) {}
}

class C5 {
  int _ = 5;
}

class C6 {
  int _() => 6;
}

class C7 {
  int get _ => 7;
}

class C8 {
  void set _(int v) {}
}

main() {
  Expect.equals(1, C1._);
  Expect.equals(2, C2._());
  Expect.equals(3, C3._);
  C4._ = 42;
  Expect.equals(5, C5()._);
  Expect.equals(6, C6()._());
  Expect.equals(7, C7()._);
  C8()._ = 42;
}
