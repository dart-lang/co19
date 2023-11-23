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
/// @description Check that constant _ can be used as a map key in a map pattern
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";

const _ = "key1";

String test1(Map<String, int> map) {
  switch(map) {
    case {_: 1}:
      return "match 1";
    case {_: _}:
      return "match _";
    default:
      return "no match";
  }
}

String test2(Map<String, int> map) {
  return switch(map) {
    {_: 1} => "match 1",
    {_: _} => "match _",
    _ => "no match"
  };
}

String test3(Map<String, int> map) {
  if (map case {_: 1}) {
    return "match 1";
  }
  if (map case {_: _}) {
    return "match _";
  }
  return "no match";
}

main() {
  var {_: a1, "key2": b1} = {"key1": 1, "key2": 2};
  Expect.equals(1, a1);
  Expect.equals(2, b1);

  final {_: a2, "key2": b2} = {"key1": 1, "key2": 2};
  Expect.equals(1, a2);
  Expect.equals(2, b2);

  var {_: _, "key2": _} = {"key1": 1, "key2": 2};

  Expect.equals("match 1", test1({"key1": 1}));
  Expect.equals("match _", test1({"key1": 2}));
  Expect.equals("no match", test1({"key2": 1}));

  Expect.equals("match 1", test2({"key1": 1}));
  Expect.equals("match _", test2({"key1": 2}));
  Expect.equals("no match", test2({"key2": 1}));

  Expect.equals("match 1", test3({"key1": 1}));
  Expect.equals("match _", test3({"key1": 2}));
  Expect.equals("no match", test3({"key2": 1}));
}
