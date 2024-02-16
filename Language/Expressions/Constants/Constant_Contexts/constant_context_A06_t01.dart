// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A constant context is introduced in situations where an
/// expression is required to be constant. This is used to allow the const
/// modifier to be omitted in cases where it does not contribute any new
/// information.
///
/// @description Checks that an initializer list is not a constant context
/// @author sgrekhov22@gmail.com

class A {
  const A();
}

class C {
  final val;
  const C.c1() : this.val = [];
//                          ^^
// [analyzer] unspecified
// [cfe] unspecified

  const C.c2() : this.val = A();
//                          ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
}
