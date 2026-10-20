// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if an extension declares a constructor
/// which is generative.
///
/// @description Checks that it is a compile-time error if an extension declares
/// a non-redirecting generative constructor. Test a class.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

class C1 {}

extension Ext1C1 on C1 {
  C1();
//^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension Ext2C1 on C1 {
  C1.someName() {}
//^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C2 {
  C2.someName();
}

extension Ext1C2 on C2 {
  new() {}
//^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension Ext2C2 on C2 {
  C2._();
//^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C3 {
  C3.someName();
}

extension Ext1C3 on C3 {
  const C3();
//      ^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension Ext2C3 on C3 {
  const foo();
//      ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C4 {
  C4.someName();
}

extension Ext1C4 on C4 {
  const new();
//      ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension Ext2C4 on C4 {
  const C4._();
//      ^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C1);
  print(C2);
  print(C3);
  print(C4);
}
