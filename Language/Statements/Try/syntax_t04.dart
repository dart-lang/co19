// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The try statement supports the definition of exception handling
/// code in a structured way.
/// tryStatement:
///   try block (onPart+ finallyPart? | finallyPart)
/// ;
/// onPart:
///   catchPart block |
///   on type catchPart? block
/// ;
/// catchPart:
///   catch ‘(’ identifier (‘, ’ identifier)? ‘)’
/// ;
/// finallyPart:
///   finally block
/// ;
/// A try statement consists of a block statement, followed by at least one of:
/// 1. A set of on-catch clauses, each of which specifies (either explicitly or
///    implicitly) the type of exception object to be handled, one or two
///    exception parameters and a block statement.
/// 2. A finally clause, which consists of a block statement.
///
/// @description Checks that it is a compile-time error if the try block is
/// missing the closing curly braces.
/// @author vasya

main() {
  try {
//^
// [analyzer] unspecified
// [cfe] unspecified
    throw 0;
  catch (ex) {}
//         ^
// [analyzer] unspecified
// [cfe] unspecified
/**/}
//  ^
// [analyzer] unspecified