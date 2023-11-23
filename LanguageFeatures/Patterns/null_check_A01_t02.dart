// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion nullCheckPattern ::= primaryPattern '?'
///
/// A null-check pattern matches if the value is not null, and then matches the
/// inner pattern against that same value. Because of how type inference flows
/// through patterns, this also provides a terse way to bind a variable whose
/// type is the non-nullable base type of the nullable value being matched:
///
/// ```dart
/// String? maybeString = ...
/// switch (maybeString) {
///   case var s?:
///     // s has type non-nullable String here.
/// }
/// ```
/// @description Check null-check pattern in a switch expression
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";

String test1(List<String?> list) {
  return switch (list) {
    [var a?, var b] => "case 1",
    [var a, var b?] => "case 2",
    _ => "default"
  };
}

String test2(List<String?> list) {
  return switch (list) {
    [_?, var b] => "case 1",
    [var a, _?] => "case 2",
    _ => "default"
  };
}

main() {
  Expect.equals("case 1", test1(["a", "b"]));
  Expect.equals("case 1", test1(["a", null]));
  Expect.equals("case 2", test1([null, "b"]));
  Expect.equals("default", test1([null, null]));

  Expect.equals("case 1", test2(["a", "b"]));
  Expect.equals("case 1", test2(["a", null]));
  Expect.equals("case 2", test2([null, "b"]));
  Expect.equals("default", test2([null, null]));
}
