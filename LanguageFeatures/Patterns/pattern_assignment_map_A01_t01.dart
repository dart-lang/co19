// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The language specifies:
///
/// An expression statement consists of an expression that does not begin with a
/// '{' character.
///
/// This avoids an ambiguity between blocks and map literals. But with map
/// patterns in assignments, it is useful to have an expression statement that
/// begins with {:
///
/// var map = {'a': 1, 'b': 2};
/// int a, b;
/// // more code...
///
/// // later...
/// {'a': a, 'b': b} = map;
/// To support this while still avoiding the ambiguity between blocks and map
/// literals, we change the above rule to:
///
/// The expression of a statement expression cannot start with a { token which
/// starts a set or map literal. It may start with a { only if that starts a map
/// pattern of a pattern assignment expression, in which case the corresponding
/// closing } must be immediately followed by a =.
///
/// @description Check that it is a compile-time error if a statement expression
/// starts with { token which doesn't start a map pattern in a pattern
/// assignment
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "patterns_lib.dart";

main() {
  var a = 42;

  {"key1": a, "key2": _};
//^
// [analyzer] unspecified
// [cfe] unspecified

  {"key1": 42, "key2": 0};
//^
// [analyzer] unspecified
// [cfe] unspecified

  {1, 2, 3};
//^
// [analyzer] unspecified
// [cfe] unspecified
}
