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
/// `try`, not as a local function
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=records

main() {
  try {
    print(0);
  } on String {
  } on (int i, {String? n}) {
  }
  on(42, n: "Lily was here");
//^^
// [analyzer] unspecified
// [cfe] unspecified
}
