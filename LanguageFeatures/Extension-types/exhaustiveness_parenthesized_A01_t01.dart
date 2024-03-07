// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Exhaustiveness of a parenthesized pattern is defined by the
/// exhaustiveness of the appropriate subpattern
///
/// @description Check that an exhaustiveness of a parenthesized pattern is
/// defined by the exhaustiveness of the appropriate subpattern. Test the case
/// when extension types are used in `case` parts of a `switch`
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";

extension type const BoolET1(bool _) {}
extension type const BoolET2(bool _) implements bool {}

const True1 = BoolET1(true);
const False1 = BoolET1(false);
const True2 = BoolET2(true);
const False2 = BoolET2(false);

String testStatement1(bool o) {
  switch (o) {
    case (True1):
      return "true";
    case (False1):
      return "false";
  }
}

String testStatement2(bool o) {
  switch (o) {
    case (True2):
      return "true";
    case (False2):
      return "false";
  }
}

String testExpression1(bool o) => switch (o) {
      (True1) => "true",
      (False1) => "false"
    };

String testExpression2(bool o) => switch (o) {
    (True2) => "true",
    (False2) => "false"
  };

main() {
  Expect.equals("true", testStatement1(true));
  Expect.equals("false", testStatement1(false));
  Expect.equals("true", testStatement2(true));
  Expect.equals("false", testStatement2(false));

  Expect.equals("true", testExpression1(true));
  Expect.equals("false", testExpression1(false));
  Expect.equals("true", testExpression2(true));
  Expect.equals("false", testExpression2(false));
}
