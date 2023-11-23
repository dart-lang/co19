// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The lifted space union for a pattern with matched value type M is
/// ...
/// Parenthesized pattern: The lifted space union of the subpattern.
///
/// @description Check that a lifted space for a parenthesized pattern is a
/// lifted space union of the subpattern.
/// @author sgrekhov22@gmail.com

import "../../../Utils/expect.dart";

const _true = true;
const _false = false;

String test1(bool o) {
  switch (o) {
    case (_true):
      return "true";
    case (_false):
      return "false";
  }
}

String test2(bool o) => switch (o) {
      (_true) => "true",
      (_false) => "false"
    };

main() {
  Expect.equals("true", test1(true));
  Expect.equals("false", test1(false));
  Expect.equals("true", test2(true));
  Expect.equals("false", test2(false));
}
