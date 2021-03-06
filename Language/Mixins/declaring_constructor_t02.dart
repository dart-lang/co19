// Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if a declared or derived mixin
/// explicitly declares a constructor which is not a factory constructor.
/// @description Checks that it is a compile-time error if a derived mixin
/// explicitly declares a constructor.
/// @author sgrekhov@unipro.ru


class A {
}

class M {
  M() {}
}

class C = A with M;
//               ^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  new C();
}
