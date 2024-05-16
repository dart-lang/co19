// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Other declarations: top-level variables, top-level function
/// names, type names, member names, etc. are unchanged. They can be named `_`
/// as they are today.
///
/// @description Checks that a member named `_` is still accessible and its
/// value can be used. Test enum members
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=wildcard-variables

import '../../Utils/expect.dart';

enum E1 {
  e1;
  static int _ = 1;
}

enum E2 {
  e1;
  static int _() => 2;
}

enum E3 {
  e1;
  static int get _ => 3;
}

enum E4 {
  e1;
  static void set _(int v) {}
}

enum E5 {
  e1;
  final int _ = 5;
}

enum E6 {
  e1;
  int _() => 6;
}

enum E7 {
  e1;
  int get _ => 7;
}

enum E8 {
  e1;
  void set _(int v) {}
}

main() {
  Expect.equals(1, E1._);
  Expect.equals(2, E2._());
  Expect.equals(3, E3._);
  E4._ = 42;
  Expect.equals(5, E5.e1._);
  Expect.equals(6, E6.e1._());
  Expect.equals(7, E7.e1._);
  E8.e1._ = 42;
}
