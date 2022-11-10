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
/// @description Check that wildcard `_` can be used in map patterns
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "../../Utils/expect.dart";

String test(Map map) {
  switch (map) {
    case {1: _}:
      return "{1: _}";
    case {String _: 42}:
      return "{String _: 42}";
    case {_: int _}:
      return "{_: int _}";
    default:
      return "default";
  }
}

main() {
  var map1 = {1: 2, 3: 4};
  var {_: _two, _: __} = map1;
  Expect.equals(2, _two);
  Expect.equals(4, __);

  var map2 = {"1": 2, "3": 4};
  var {String _: two, _: num ___} = map2;
  Expect.equals(2, two);
  Expect.equals(4, ___);

  Expect.throws(() {
    var {int _: _, _: num _} = map2;
  });
  Expect.throws(() {
    var {_: String _, _: num _} = map2;
  });
  Expect.equals("{1, _}", {1: 2});
  Expect.equals("{1, _}", {1: 42});
  Expect.equals("{String _: 42}", {"", 42});
  Expect.equals("{_: int _}", {true, 42});
  Expect.equals("{_: int _}", {"x", 41});
  Expect.equals("default", {2: 1});
  Expect.equals("default", {1: 2, 2: 1});
  Expect.equals("default", {});
}
