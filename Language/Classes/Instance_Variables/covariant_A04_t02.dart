// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is possible for the declaration of an instance variable to
/// include the modifier covariant. The effect of this is that the formal
/// parameter of the corresponding implicitly induced setter is considered to be
/// covariant-by-declaration
///
/// @description Checks that it is a compile-time error if an implemented
/// interface of a class conflicts with implicitly induced getter of a covariant
/// instance variable.
/// @author sgrekhov22@gmail.com

class A {
  num v = 1;
}

class I {
  covariant int v = 3;
}

class C extends A implements I {
//    ^
// [analyzer] unspecified
// [cfe] unspecified
  void set v(Object val) {}
}

main() {
  print(C);
}
