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
/// @description Check that wildcard `_` can be used in list patterns
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";

String test1(List list) {
  switch (list) {
    case [_, 2, var x]:
      return "[_, 2, var x]";
    case [String _, _, _]:
      return "[String _, _, _]";
    default:
      return "default";
  }
}

String test2(List list) {
  return switch (list) {
    case [_, 2, var x] => "[_, 2, var x]";
    case [String _, _, _] => "[String _, _, _]";
    default => "default";
  };
}

String test3(List list) {
  if (list case [_, 2, var x]) {
    return "[_, 2, var x]";
  }
  if (list case [String _, _, _]) {
    return "[String _, _, _]";
  } else {
    return "default";
  }
}

main() {
  var list1 = [1, 2, 3, 4];
  var [_, _two, _, __] = list1;
  Expect.equals(2, _two);
  Expect.equals(4, __);

  var list2 = ["1", 2, "3", 4];
  var [String _, two, _, num ___] = list2;
  Expect.equals(2, two);
  Expect.equals(4, ___);

  Expect.throws(() {
    var [int _, _, _, num _] = list2;
  });
  Expect.throws(() {
    var [_, String _, _, num _] = list2;
  });
  Expect.equals("[_, 2, var x]", test1([1, 2, "3"]));
  Expect.equals("[String _, _, _]", test1(["0", 1, 2]));
  Expect.equals("default", test1([1, 1, 3]));
  Expect.equals("default", test1([[1, 2], 3, 4]));

  Expect.equals("[_, 2, var x]", test2([1, 2, "3"]));
  Expect.equals("[String _, _, _]", test2(["0", 1, 2]));
  Expect.equals("default", test2([1, 1, 3]));
  Expect.equals("default", test2([[1, 2], 3, 4]));

  Expect.equals("[_, 2, var x]", test3([1, 2, "3"]));
  Expect.equals("[String _, _, _]", test3(["0", 1, 2]));
  Expect.equals("default", test3([1, 1, 3]));
  Expect.equals("default", test3([[1, 2], 3, 4]));
}
