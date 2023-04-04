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
/// @description Check that if a constant have no primitive equality then its
/// lifted space is an empty space
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../../Utils/expect.dart";

class C {
  final bool v;
  const C(this.v);

  bool operator ==(covariant bool other) => v == other;
}

const True = C(true);
const False = C(false);

String test1(bool b) {
  switch (b) {
    case True:
      return "True";
    case False:
      return "False";
    case true:
      return "true";
    case false:
      return "false";
  }
}

String test2(bool b) => switch (b) {
      True => "True",
      False => "False",
      true => "true",
      false => "false"
    };

main() {
  Expect.equals("True", test1(true));
  Expect.equals("False", test1(false));
  Expect.equals("True", test2(true));
  Expect.equals("False", test2(false));
}
