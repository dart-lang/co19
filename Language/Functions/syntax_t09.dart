// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion Functions include function declarations, methods, getters,
/// setters, constructors and function literals.
/// All functions have a signature and a body.
/// functionSignature:
///   metadata returnType? identifier formalParameterList
/// ;
/// returnType: void | type
/// ;
/// functionBody:
///   async? '=>' expression ';' | (async | async* | sync*)? block
/// ;
/// block:
///   '{' statements '}'
/// ;
///
/// @description Checks that it is a compile error if the function body of the
/// form ['=>' expression ';'] isn't terminated with semicolon
///
/// @author msyabro
/// @reviewer kaigorodov
/// @reviewer iefremov


main() {
  try {
    f();
  } catch (x) {}
}

int f() => 1
//         ^
// [analyzer] unspecified
// [cfe] unspecified
// [error line 41, column 0]
// [cfe] unspecified