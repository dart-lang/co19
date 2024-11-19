// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let `C` be a type literal denoting a class, mixin, or extension.
/// It is a warning to use a null aware member access with receiver `C`.
///
/// @description Check that it is a warning to use a null aware member access
/// with a type literal.
/// @author sgrekhov22@gmail.com

class C {
  static void test() {}
}

mixin M {
  static void test() {}
}

enum E {
  e0;
  static void test() {}
}

class A {}

extension Ext on A {
  static void test() {}
}

extension type ET(int _) {
  static void test() {}
}

main() {
  C?.test();
// ^^
// [analyzer] unspecified
  M?.test();
// ^^
// [analyzer] unspecified
  E?.test();
// ^^
// [analyzer] unspecified
  Ext?.test();
//   ^^
// [analyzer] unspecified
  ET?.test();
//  ^^
// [analyzer] unspecified
}
