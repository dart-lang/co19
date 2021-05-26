// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion  It is a compile time error if an element of a constant list
/// literal is not a compile-time constant. It is a compile time error if the
/// type argument of a constant list literal includes a type parameter.
/// @description Checks that a constant list literal cannot contain non-constant
/// expression.
/// @author kaigorodov
/// @reviewer iefremov


class A {
  List a = const [1, new Date.now()];
//                       ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  new A();
}
