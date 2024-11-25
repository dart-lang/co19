// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// - The resulting constructor is not valid (it has a redirection as well as
///   some initializer list elements, or it has multiple super initializers,
///   etc).
///
/// @description Checks that it is a compile-time error if the resulting
/// constructor has multiple super initializers.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part 'augmenting_constructors_A06_t02_lib.dart';

class A {
  int x;
  A(this.x);
}

class C extends A {
  C() : super(0);
//^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
}
