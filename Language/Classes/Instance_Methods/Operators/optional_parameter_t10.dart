// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error to declare an optional parameter in an 
/// operator.
///
/// @description Checks that a compile-time error is produced if a user-defined
/// operator with arity 1 specifies a named parameter.
/// @author sgrekhov22@gmail.com
/// @issue 53332

class C {
  int operator +({int other}) => 42;
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  int operator -({int other = 0}) => 42;
//                ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  int operator *({required int other}) => 42;
//                ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M {
  int operator +({int other}) => 42;
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  int operator -({int other = 0}) => 42;
//                ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  int operator *({required int other}) => 42;
//                ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e1, e2;

  int operator +({int other}) => 42;
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  int operator -({int other = 0}) => 42;
//                ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  int operator *({required int other}) => 42;
//                ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(M);
  print(E);
}
