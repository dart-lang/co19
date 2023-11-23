// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion You cannot have both a C and a C.new constructor declaration in
/// the same class, they denote the same constructor
///
/// @description Checks that it's impossible to have default constructors
/// declared with [new] syntax and with class name at the same time. Test
/// constant constructor
///
/// @author iarkh@unipro.ru

class A1 {
  A1() {}
  const A1.new();
//      ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class A2 {
  const A2.new();
  A2() {}
//^^
// [analyzer] unspecified
// [cfe] unspecified
}

class B1 {
  const B1();
  B1.new() {}
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class B2 {
  B2.new() {}
  const B2();
//      ^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C1 {
  const C1();
  const C1.new();
//      ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C2 {
  const C2.new();
  const C2();
//      ^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {}
