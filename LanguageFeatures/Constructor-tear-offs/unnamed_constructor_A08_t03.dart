// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion You cannot have both a C and a C.new constructor declaration in
/// the same class, they denote the same constructor
///
/// @description Checks that it's impossible to have default constructors
/// declared with [new] syntax and with class name at the same time. Test
/// factory constructor
///
/// @author iarkh@unipro.ru

class C1 {
  C1();
  factory C1.new() = D1;
//        ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class D1 extends C1 {
  D1();
}

class C2 {
  C2.new();
  factory C2() = D2;
//        ^^
// [analyzer] unspecified
// [cfe] unspecified
}

class D2 extends C2 {
  D2();
}

main() {}
