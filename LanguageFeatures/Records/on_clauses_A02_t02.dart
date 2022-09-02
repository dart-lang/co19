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
/// whose matched type is the record type `(a, b)`. When presented with this
/// ambiguity, we disambiguate by treating `on` as a clause for `try` and not a
/// local function. This is technically a breaking change, but is unlikely to
/// affect any code in the wild.
///
/// @description Checks that in the case above `on` is treated as a clause for
/// `try`, not as a local function. Test the case when `on` clause looks like a
/// function with optional positional parameters and default values specified
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=records

main() {
  try {
    print(0);
  } on String {
  } on ([int i = 0, String n = ""]) {
//      ^
// [analyzer] unspecified
// [cfe] unspecified
  }
  on();
//^^
// [analyzer] unspecified
// [cfe] unspecified
}
