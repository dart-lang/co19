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

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";

String test(List<String?> list) {
  switch (list) {
    case [var a?, var b] => "case 1";
    case [var a, var b?] => "case 2";
    default => "default";
  }
}

main() {
  Expect.equals("case 1", test(["a", "b"]));
  Expect.equals("case 1", test(["a", null]));
  Expect.equals("case 2", test([null, "b"]));
  Expect.equals("default", test([null, null]));
}
