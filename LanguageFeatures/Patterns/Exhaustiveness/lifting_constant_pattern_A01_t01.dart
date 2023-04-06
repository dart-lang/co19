// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The lifted space union for a pattern with matched value type M is
/// ...
/// Constant pattern:
/// i. If the constant has primitive equality, then a space whose type is the
///   type of the constant and with a constant restriction for the given
///   constant value.
/// ii. Else the empty space union.
///
/// @description Check that if a constant has primitive equality, then a lifted
/// space is a space whose type is the type of the constant and with a constant
/// restriction for the given constant value.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../../Utils/expect.dart";

String test1(bool o) {
  switch (o) {
    case true:
      return "true";
    case false:
      return "false";
  }
}

String test2(bool o) => switch (o) {
    true => "true",
    false => "false"
  };

main() {
  Expect.equals("true", test1(true));
  Expect.equals("false", test1(false));
  Expect.equals("true", test2(true));
  Expect.equals("false", test2(false));
}
