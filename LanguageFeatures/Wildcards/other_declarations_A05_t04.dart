// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Other declarations: top-level variables, top-level function
/// names, type names, member names, etc. are unchanged. They can be named `_`
/// as they are today.
///
/// @description Checks that a member named `_` is still accessible and its
/// value can be used. Test extension type members
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=wildcard-variables

import '../../Utils/expect.dart';

extension type ET1(int id) {
  static int _ = 1;
}

extension type ET2(int id) {
  static int _() => 2;
}

extension type ET3(int id) {
  static int get _ => 3;
}

extension type ET4(int id) {
  static void set _(int v) {}
}

extension type ET5(int id) {
  int _() => 5;
}

extension type ET6(int id) {
  int get _ => 6;
}

extension type ET7(int id) {
  void set _(int v) {}
}

main() {
  Expect.equals(1, ET1._);
  Expect.equals(2, ET2._());
  Expect.equals(3, ET3._);
  ET4._ = 42;
  Expect.equals(5, ET5(1)._());
  Expect.equals(6, ET6(1)._);
  ET7(1)._ = 42;
}
