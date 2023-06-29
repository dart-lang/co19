// Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error to derive a mixin from a class that
/// declares a generative constructor, or from a class that has a superclass
/// other than Object.
///
/// @description Checks that it is a compile-time error if a derived mixin
/// explicitly declares a named constructor.
/// @author sgrekhov@unipro.ru

// @dart=2.19

class A {
}

class M {
  M.n() {}
}

class C = A with M;
//               ^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  new C();
}
