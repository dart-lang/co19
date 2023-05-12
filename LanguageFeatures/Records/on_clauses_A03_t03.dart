// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Consider:
///
/// void foo() {
///   try {
///     ;
///   } on Bar {
///     ;
///   }
///   on(a, b) {;} // <--
/// }
/// Before, the marked line could only be declaring a local function named `on`.
/// With record types, it could be a second `on` clause for the `try` statement
/// whose matched type is the record type `(a, b)`.
/// ...
/// Whenever on appears after a try block or after a preceding `on` clause on a
/// try block, we unconditionally parse it as an `on` clause and not a local
/// function. This may yield a syntax error if the code after on is not a `on`
/// clause (but would be a valid function declaration). In other words, you
/// can't have a local function named `on` with no return type immediately
/// following a try block.
///
/// @description Checks that it is possible to have a function named `on` after
/// try block if this function has a return type specified
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";

main() {
  bool caught = false;
  try {
    throw ();
  } on String {
    Expect.fail("Unexpected String exception");
  } on () {
    caught = true;
  }
  int on() {
    return 42;
  }
  Expect.isTrue(caught);
  Expect.equals(42, on());
}
