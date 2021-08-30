// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If [C] denotes a class, an expression of [C] by itself already
/// has a meaning, it evaluates to a [Type] object representing the class, so it
/// cannot also denote the unnamed constructor.
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
  A.new(T3 z) {}
//  ^^^
// [analyzer] unspecified
// [cfe] unspecified

  D(T1 x, T2 t) {}
}

main() {}
