// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion You cannot have both a C and a C.new constructor declaration in
/// the same class, they denote the same constructor
///
/// @description Checks that it's impossible to have default constructors
/// declared with [new] syntax and with class name at the same time.
///
/// @author iarkh@unipro.ru

class A {
  A() {}
  A.new() {}
//  ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class B {
  B(int i) {}
  B.new(int i) {}
//  ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C<T> {
  C(int i, double j, k) {}
  C.new() {}
//  ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class D<T1 extends List, T2 extends int, T3> {
  D(T1 x, T2 t) {}
  D.new(T3 z) {}
//  ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {}
