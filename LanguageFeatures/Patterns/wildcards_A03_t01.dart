// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
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
/// @description Check that if an object contains getter named _ then it can be
/// used in an Object pattern
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "../../Utils/expect.dart";

class C {
  int get _ => 42;
}

String test1() {
  C c = C();
  switch(c) {
    case C(_: 42):
      return "match";
    default:
      return "no match";
  }
}

String test2() {
  C c = C();
  return switch(c) {
    C(_: 42) => "match",
    _ => "no match"
  };
}

String test3() {
  C c = C();
  if (c case C(_: 42)) {
    return "match";
  }
  return "no match";
}

main() {
  var C(_: underscore1) = C();
  Expect.equals(42, underscore1);

  final C(_: int underscore2) = C();
  Expect.equals(42, underscore2);

  Expect.equals("match", test1());
  Expect.equals("match", test2());
  Expect.equals("match", test3());
}
