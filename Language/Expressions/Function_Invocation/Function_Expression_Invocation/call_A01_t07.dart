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
/// @description Checks that if a getter named `call` returns a function id
/// doesn't make an object callable
/// @author sgrekhov22@gmail.com
/// @issue 55803

class C {
  Function get call => () {print("C");};
}

mixin M {
  Function get call => () {print("M");};
}

enum E {
  e0;
  Function get call => () {print("E");};
}

extension type ET(int _) {
  Function get call => () {print("ET");};
}

class A {}

extension Ext on A {
  Function get call => () {print("Ext");};
}

class MA = Object with M;

void main() {
  C().call(); // Ok
  C()();
//^^^
// [analyzer] unspecified
// [cfe] unspecified

  MA().call(); // Ok
  MA()();
//^^^^
// [analyzer] unspecified
// [cfe] unspecified

  E.e0.call(); // Ok
  E.e0();
//^^^^
// [analyzer] unspecified
// [cfe] unspecified

  ET(0).call(); // Ok
  ET(1)();
//^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  A().call(); // Ok
  A()();
//^^^
// [analyzer] unspecified
// [cfe] unspecified
}
