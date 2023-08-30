// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

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
/// @description Checks that the assert statement can't be a body of a function
/// of the form [functionSignature '=>' expression ';'].
///
/// @author msyabro


f() => assert (false);
//     ^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  f();
}
