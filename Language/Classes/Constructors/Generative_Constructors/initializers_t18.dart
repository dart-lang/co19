// Copyright (c) 2023 , the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion 
/// initializers:
///   ':' superCallOrFieldInitializer (', ' superCallOrFieldInitializer)*
/// ;
/// superCallOrFieldInitializer: 
///   super arguments  | super '.' identifier arguments | fieldInitializer
/// ;
/// fieldInitializer:
///   (this '.')? identifier '=' conditionalExpression cascadeSection*
/// ;
/// @description Checks that it is a syntax error to use a function literal in
/// the initializer list
/// @author sgrekhov22@gmail.com

void foo() {}

class C1 {
  void Function() f;
  C1() : f = foo; // Ok
  C1.c1() : f = () {};
//              ^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C2 {
  int Function() f;
  C2() : f = () => 42;
//           ^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C3 {
  int Function(int i) f;
  C3.c1() : f = (int i) => i;
//              ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  C3.c2() : f = (int i) {return i;};
//              ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C1);
  print(C2);
  print(C3);
}
