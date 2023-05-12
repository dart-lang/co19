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
/// @description Check null-check pattern in a switch statement
/// @author sgrekhov22@gmail.com

import "../../Utils/static_type_helper.dart";
import "../../Utils/expect.dart";

test(String? s) {
  switch (s) {
    case var v1?:
      v1.expectStaticType<Exactly<String>>();
      v1.substring(0);
      break;
    case var v2:
      v2.expectStaticType<Exactly<String?>>();
      v2?.substring(0);
      break;
    default:
      Expect.fail("Shouldn't be here");
  }
}

main() {
  test("");
  test(null);
}
