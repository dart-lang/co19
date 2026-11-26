// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Other declarations: top-level variables, top-level function
/// names, type names, member names, etc. are unchanged. They can be named `_`
/// as they are today.
/// ...
/// Named fields of record types are unchanged. It is still a compile-time
/// error for a named field name to start with `_`.
/// ...
/// Even though the parameters no longer collide, it is still an error to have
/// two initializing formals named `_`
///
/// @description Checks that it is a compile-time error to declare more than
/// one type alias named `_`, a record type with a named field `_` or more than
/// one initializing formal `this._`. Test declarations which use the old
/// function type syntax.
/// @author sgrekhov22@gmail.com

// @dart=3.15

typedef void _();

typedef int _(int x);
//          ^
// [analyzer] unspecified
// [cfe] unspecified

typedef ({int _}) R1();
//            ^
// [analyzer] unspecified
// [cfe] unspecified

typedef void R2(({String _}) r);
//                       ^
// [analyzer] unspecified
// [cfe] unspecified

void f(void g(({int _}) r)) {}
//                  ^
// [analyzer] unspecified
// [cfe] unspecified

class C {
  final _;
  C(this._(), this._());
//                 ^
// [analyzer] unspecified
// [cfe] unspecified

  get value => _;
}

main() {
  print(_);
  print(R1);
  print(R2);
  print(f);
  print(C);
}
