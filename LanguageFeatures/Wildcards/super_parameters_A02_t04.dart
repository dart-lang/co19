// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The positional formal parameter super._ is still allowed in
/// non-redirecting generative constructors. Such a parameter forwards the
/// argument's value to the super constructor invocation.
///
/// @description Check that is is still a compile-time error to use `super._` in
/// redirecting and factory constructors
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=wildcard-variables

class A {
  int x;
  A(this.x);
}

class C extends A {
  C(super._);
  C.r(super._) : this(0);
//    ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  factory C.f1(int super._) = C;
//                 ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  factory C.f2(super._) => C(0);
//             ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
}
