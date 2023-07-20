// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is possible for the declaration of an instance variable to
/// include the modifier covariant. The effect of this is that the formal
/// parameter of the corresponding implicitly induced setter is considered to be
/// covariant-by-declaration
///
/// @description Checks that it is a compile-time error if implicitly induced
/// getter of a covariant instance variable conflicts with type of a setter
/// @author sgrekhov22@gmail.com

class A {
  covariant num v = 1;
}

class C extends A {
  void set v(int val) {}
//         ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
}
