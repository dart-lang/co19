// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// The context type schema for a pattern p is:
/// ...
/// Identifier:
/// In an assignment context, the context type schema is the static type of the
/// variable that p resolves to.
///
/// Else the context type schema is _
///
/// @description Check that in an assignment context, the context type schema is
/// the static type of the variable that p resolves to. Test promoted type
/// @author sgrekhov22@gmail.com

main() {
  num a = 0;
  a as int;
  a.isEven;
  [a] = [3.14]; // [a] infers <int>[3.14] to right hand expression
//       ^^^^
// [analyzer] unspecified
// [cfe] unspecified

  var c = 2 > 1 ? 42 : 3.14;
  c as int;
  c.isEven;
  {"key1": c} = {"key1": 3.14};
//                       ^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
