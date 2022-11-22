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

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";

String test1(Map map) {
  switch (map) {
    case {1: _}:
      return "{1: _}";
    case {42: String _}:
      return "{42: String _}";
    default:
      return "default";
  }
}

String test2(Map map) {
  return switch (map) {
    case {1: _} => "{1: _}";
    case {42: String _} => "{42: String _}";
    default => "default";
  };
}

String test3(Map map) {
  if (map case {1: _}) {
    return "{1: _}";
  }
  if (map case {42: String _}) {
    return "{42: String _}";
  }
    return "default";
  }
}

main() {
  var map1 = {1: 2, 3: 4};
  var {1: _, 2: __} = map1;
  Expect.equals(4, __);

  var map2 = {"1": 2, "3": 4};
  var {"1": _, _: num ___} = map2;
  Expect.equals(4, ___);

  Expect.throws(() {
    var {"1": String _, "3": num _} = map2;
  });
  Expect.throws(() {
    var {"1": _, "3": String _} = map2;
  });
  Expect.equals("{1, _}", test1({1: 2, 2: 1}));
  Expect.equals("{1, _}", test1({1: 3, 42: ""}));
  Expect.equals("{42: String _}", test1({42: "", 2: "2"}));
  Expect.equals("default", test1({2: 1}));
  Expect.equals("default", test1({3: 2, 2: 1}));
  Expect.equals("default", test1({}));

  Expect.equals("{1, _}", test2({1: 2, 2: 1}));
  Expect.equals("{1, _}", test2({1: 3, 42: ""}));
  Expect.equals("{42: String _}", test2({42: "", 2: "2"}));
  Expect.equals("default", test2({2: 1}));
  Expect.equals("default", test2({3: 2, 2: 1}));
  Expect.equals("default", test2({}));

  Expect.equals("{1, _}", test3({1: 2, 2: 1}));
  Expect.equals("{1, _}", test3({1: 3, 42: ""}));
  Expect.equals("{42: String _}", test3({42: "", 2: "2"}));
  Expect.equals("default", test3({2: 1}));
  Expect.equals("default", test3({3: 2, 2: 1}));
  Expect.equals("default", test3({}));
}
