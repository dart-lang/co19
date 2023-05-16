// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The lifted space union for a pattern with matched value type M is
/// ...
/// Variable pattern or identifier pattern: The lifted space union of the static
/// type of the corresponding variable.
///
/// @description Check that a lifted space for an identifier pattern is a union
/// of the static type of the corresponding variable.
/// @author sgrekhov22@gmail.com

import "../../../Utils/expect.dart";

const _true = true;
const _false = false;

String test1(bool o) {
  switch (o) {
    case _true:
      return "true";
    case _false:
      return "false";
  }
}

String test2(bool o) => switch (o) {
      _true => "true",
      _false => "false"
    };

main() {
  Expect.equals("true", test1(true));
  Expect.equals("false", test1(false));
  Expect.equals("true", test2(true));
  Expect.equals("false", test2(false));
}
