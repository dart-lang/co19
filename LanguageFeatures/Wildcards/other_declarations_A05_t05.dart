// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Other declarations: top-level variables, top-level function
/// names, type names, member names, etc. are unchanged. They can be named `_`
/// as they are today.
///
/// @description Checks that a member named `_` is still accessible and its
/// value can be used. Test extension members
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=wildcard-variables

import '../../Utils/expect.dart';

class A1 {}
extension Ext1 on A1 {
  static int _ = 1;
}

class A2 {}
extension Ext2 on A2 {
  static int _() => 2;
}

class A3 {}
extension Ext3 on A3 {
  static int get _ => 3;
}

class A4 {}
extension Ext4 on A4 {
  static void set _(int v) {}
}

class A5 {}
extension Ext5 on A5 {
  int _() => 5;
}

class A6 {}
extension Ext6 on A6 {
  int get _ => 6;
}

class A7 {}
extension Ext7 on A7 {
  void set _(int v) {}
}

main() {
  Expect.equals(1, Ext1._);
  Expect.equals(2, Ext2._());
  Expect.equals(3, Ext3._);
  Ext4._ = 42;
  Expect.equals(5, A5()._());
  Expect.equals(6, A6()._);
  A7()._ = 42;
}
