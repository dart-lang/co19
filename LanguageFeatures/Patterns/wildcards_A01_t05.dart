// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// If the variable's name is _, it doesn't bind any variable. This "wildcard"
/// name is useful as a placeholder in places where you need a subpattern in
/// order to destructure later positional values:
/// ```dart
/// var list = [1, 2, 3];
/// var [_, two, _] = list;
/// ```
/// The `_` identifier can also be used with a type annotation when you want to
/// test a value's type but not bind the value to a name:
/// ```dart
/// switch (record) {
///   case (int _, String _):
///     print('First field is int and second is String.');
/// }
/// ```
/// @description Check that wildcard `_` can be used in parenthesized patterns
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";

String test1(int x) {
  switch (x) {
    case (_) when 2 > 1: // to avoid dead code warning
      return "(_)";
    default:
      return "default";
  }
}

String test2(int x) {
  return switch (x) {
      (_) => "(_)"
  };
}

String test3(String s) {
  if (s case (_)) {
    return "(_)";
  }
}

var _ = -1;

main() {
  (_) = (1);
  Expect.equals(-1, _);

  Expect.equals("(_)", test1(1));
  Expect.equals("(_)", test2(2));
  Expect.equals("(_)", test2(3));
}
