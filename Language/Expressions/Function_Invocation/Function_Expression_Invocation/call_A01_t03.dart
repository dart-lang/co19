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
/// @description Checks that an interface containing a `call` getter is not
/// assignable to the type `Function`
/// @author sgrekhov22@gmail.com

class C {
  int get call => 1;
}

enum E {
  e1, e2;

  int get call => 2;
}

mixin M {
  int get call => 3;
}

class MA = Object with M;

main() {
  Function f1 = C();
//              ^^^
// [analyzer] unspecified
// [cfe] unspecified
  Function f2 = E.e1;
//              ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  Function f3 = MA();
//              ^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
