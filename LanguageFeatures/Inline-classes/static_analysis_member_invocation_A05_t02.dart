// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If Dm is a method with function type F, and args exists, the
/// static analysis of the inline member invocation is the same as that of an
/// invocation with argument part args of a function with type [T1/X1 .. Ts/Xs]F
///
/// @description Checks that it is a compile-time error if to specify a wrong
/// type argument of a torn-off method
/// specified
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

inline class IC1 {
  final int id;
  IC1(this.id);

  int foo<T1, T2 extends num>() => 42;
}

main() {
  IC1 ic1 = IC1(42);
  ic1.foo<String, String>;
//                ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
