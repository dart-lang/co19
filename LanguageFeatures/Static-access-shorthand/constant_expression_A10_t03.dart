// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A static member shorthand expression should be a potentially
/// constant expression if the corresponding explicit static member plus
/// selectors expression would be, which currently means that it's a potentially
/// constant expression if and only if it's a constant expression.
///
/// @description Checks that it is a compile-time error if a non-constant static
/// member shorthand expression is used in the initializer list of the constant
/// constructor.
/// @author sgrekhov22@gmail.com
/// @issue 59804

// SharedOptions=--enable-experiment=dot-shorthands

class A {
  int id;
  A(this.id);
  static A answer = A(42);
}

class C {
  final A a;
  const C(this.a);
  const C.fromAnswer() : a = .answer;
//                           ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
}
