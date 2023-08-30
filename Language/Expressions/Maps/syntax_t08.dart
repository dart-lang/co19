// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A map literal denotes a map object.
/// mapLiteral:
///   const? typeArguments? '{' (mapLiteralEntry (',' mapLiteralEntry)* ','?)?
///   '}'
/// ;
/// mapLiteralEntry:
///   expression ':' expression
/// ;
/// A map literal consists of zero or more entries. Each entry has a key and a
/// value. Each key and each value is denoted by an expression.
/// @description Checks that it is a compile-time error if a map literal
/// does not end with '}'.
/// @author msyabro


main() {
//     ^
// [cfe] unspecified
  var x = {"key1": true, "key2":false;
//                                   ^
// [analyzer] unspecified
// [cfe] unspecified
}
//^
// [analyzer] unspecified
// [cfe] unspecified
// [error line 32, column 0]
// [analyzer] unspecified