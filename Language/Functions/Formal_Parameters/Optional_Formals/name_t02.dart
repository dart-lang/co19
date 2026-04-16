// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if the name of a named optional
/// parameter begins with an `_` character.
///
/// @description Checks that it is a compile-time error if the name of a named
/// parameter of a constructor begins with an '_' character.
/// @author rodionov
/// @issue 63128

// @dart=3.11

class A {
  String _p;
  A({this._p = ""});
//        ^^
// [analyzer] unspecified
// [cfe] unspecified

  A.foo({String _p = ""}) : _p = _p;
//              ^^
// [analyzer] unspecified
// [cfe] unspecified

  A.bar({required this._p});
//                     ^^
// [analyzer] unspecified
// [cfe] unspecified

  A.baz({required String _p}) : _p = _p;
//                       ^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C {
  String? _;
  C({this._});
//        ^
// [analyzer] unspecified
// [cfe] unspecified

  C.foo({String _ = ""});
//              ^
// [analyzer] unspecified
// [cfe] unspecified

  C.bar({required this._});
//                     ^
// [analyzer] unspecified
// [cfe] unspecified

  C.baz({required String _});
//                       ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  A(_p: "Optional parameter names must not begin with an underscore!");
  A.foo(_p: "Optional parameter names must not begin with an underscore!");
  A.bar(_p: "Optional parameter names must not begin with an underscore!");
  A.baz(_p: "Optional parameter names must not begin with an underscore!");
  C(_: "Optional parameter names must not begin with an underscore!");
  C.foo(_: "Optional parameter names must not begin with an underscore!");
  C.bar(_: "Optional parameter names must not begin with an underscore!");
  C.baz(_: "Optional parameter names must not begin with an underscore!");
}
