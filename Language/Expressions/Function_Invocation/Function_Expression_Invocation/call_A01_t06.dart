// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A function expression invocation i has the form
/// ef <A1, . . . , Ar>(a1, . . . , an, xn+1: an+1, . . . , xn+k: an+k),
/// where ef is an expression.
/// ...
/// Let F be the static type of ef . If F is an interface type that has a method
/// named call, i is treated as the ordinary invocation
/// ef .call<A1, . . . , Ar>(a1, . . . , an, xn+1: an+1, . . . , xn+k: an+k)
///
/// @description Checks that it is a compile-time error to assign an implicit
/// tear off a `call` getter or setter to the type `Function`
/// @author sgrekhov22@gmail.com

class A {
  int get call => 42;
}

class B {
  void set call(int _) {}
}

Function f1<X extends A>(X x) => x;
//                               ^
// [analyzer] unspecified
// [cfe] unspecified
Function f2<X extends B>(X x) => x;
//                               ^
// [analyzer] unspecified
// [cfe] unspecified

void main() {
  print(f1);
  print(f2);
}
