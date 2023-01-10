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
/// @description Check that wildcard `_` can be used in record patterns
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "../../Utils/expect.dart";

String test1(Record r) {
  switch (r) {
    case (_, 2, var x):
      return "(_, 2, var x)";
    case (String _, _, _):
      return "(String _, _, _)";
    default:
      return "default";
  }
}

String test2(Record r) {
  return switch (r) {
    (_, 2, var x) => "(_, 2, var x)",
    (String _, _, _) => "(String _, _, _)",
    _ => "default"
  };
}

String test3(Record r) {
  if (r case (_, 2, var x)) {
    return "(_, 2, var x)";
  }
  if (r case (String _, _, _)) {
    return "(String _, _, _)";
  } else {
    return "default";
  }
}

main() {
  var r1 = (1, 2, 3, 4);
  var (_, _two, _, __) = r1;
  Expect.equals(2, _two);
  Expect.equals(4, __);

  var r2 = ("1", 2, "3", 4);
  var (String _, two, _, num ___) = r2;
  Expect.equals(2, two);
  Expect.equals(4, ___);

  dynamic r3 = r2;
  Expect.throws(() {
    var (int _, _, _, num _) = r3;
  });
  Expect.throws(() {
    var (_, String _, _, num _) = r3;
  });
  Expect.equals("(_, 2, var x)", test1((1, 2, "3")));
  Expect.equals("(String _, _, _)", test1(("0", 1, 2)));
  Expect.equals("default", test1((1, 1, 3)));
  Expect.equals("default", test1(((1, 2), 3, 4)));

  Expect.equals("(_, 2, var x)", test2((1, 2, "3")));
  Expect.equals("(String _, _, _)", test2(("0", 1, 2)));
  Expect.equals("default", test2((1, 1, 3)));
  Expect.equals("default", test2(((1, 2), 3, 4)));

  Expect.equals("(_, 2, var x)", test3((1, 2, "3")));
  Expect.equals("(String _, _, _)", test3(("0", 1, 2)));
  Expect.equals("default", test3((1, 1, 3)));
  Expect.equals("default", test3(((1, 2), 3, 4)));
}
