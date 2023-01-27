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
/// @description Check that wildcard `_` can be used in Object patterns
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "patterns_lib.dart";
import "../../Utils/expect.dart";

String test1(Shape shape) {
  switch (shape) {
    case Rectangle(sizeAsInt: 1, area: _):
      return "Rectangle(size: 1, area: _)";
    case Rectangle(sizeAsInt: 2, area: _):
      return "Rectangle(size: 2, area: _)";
    default:
      return "default";
  }
}

String test2(Shape shape) {
  return switch (shape) {
    Rectangle(sizeAsInt: 1, area: _) => "Rectangle(size: 1, area: _)",
    Rectangle(sizeAsInt: 2, area: _) => "Rectangle(size: 2, area: _)",
    _ => "default"
  };
}

String test3(Shape shape) {
  if (shape case Rectangle(sizeAsInt: 1, area: _)) {
    return "Rectangle(size: 1, area: _)";
  }
  if (shape case Rectangle(sizeAsInt: 2, area: _)) {
    return "Rectangle(size: 2, area: _)";
  } else {
    return "default";
  }
}

main() {
  Expect.equals("Rectangle(size: 1, area: _)", test1(Rectangle(1, 2)));
  Expect.equals("Rectangle(size: 1, area: _)", test1(Rectangle(1, 3)));
  Expect.equals("Rectangle(size: 2, area: _)", test1(Rectangle(2, 2)));
  Expect.equals("Rectangle(size: 2, area: _)", test1(Rectangle(2, 1)));
  Expect.equals("default", test1(Rectangle(3, 2)));

  Expect.equals("Rectangle(size: 1, area: _)", test2(Rectangle(1, 2)));
  Expect.equals("Rectangle(size: 1, area: _)", test2(Rectangle(1, 3)));
  Expect.equals("Rectangle(size: 2, area: _)", test2(Rectangle(2, 2)));
  Expect.equals("Rectangle(size: 2, area: _)", test2(Rectangle(2, 1)));
  Expect.equals("default", test2(Rectangle(3, 2)));

  Expect.equals("Rectangle(size: 1, area: _)", test3(Rectangle(1, 2)));
  Expect.equals("Rectangle(size: 1, area: _)", test3(Rectangle(1, 3)));
  Expect.equals("Rectangle(size: 2, area: _)", test3(Rectangle(2, 2)));
  Expect.equals("Rectangle(size: 2, area: _)", test3(Rectangle(2, 1)));
  Expect.equals("default", test3(Rectangle(3, 2)));
}
