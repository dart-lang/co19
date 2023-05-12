// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion There is no record type literal syntax that can be used as an
/// expression, since it would be ambiguous with other existing syntax:
///
/// var t = (int, String);
/// This is a record expression containing two type literals, [int] and
/// [String], not a type literal for a record type.
///
/// @description Checks that there is no record type literal syntax that can be
/// used as an expression
/// @author sgrekhov22@gmail.com

main() {
  var t1 = (int, {String s});
//               ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  var t2 = ({int i, String s});
//          ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  var t3 = (int i, String s);
//         ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
