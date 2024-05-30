// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The positional formal parameter super._ is still allowed in
/// non-redirecting generative constructors. Such a parameter forwards the
/// argument's value to the super constructor invocation.
///
/// @description Check that is is still a compile-time error to use `super._`as
/// a named parameter
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=wildcard-variables

class A {
  final int x;
  const A({this.x = 0});
}

class C extends A {
  C({super._ = 1});
//         ^
// [analyzer] unspecified
// [cfe] unspecified
  const C.cnst({super._ = 2});
//                    ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
}
