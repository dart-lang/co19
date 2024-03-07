// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Exhaustiveness of a parenthesized pattern is defined by the
/// exhaustiveness of the appropriate subpattern
///
/// @description Check that an exhaustiveness of a parenthesized pattern is
/// defined by the exhaustiveness of the appropriate subpattern. Test the case
/// when extension types are used in the expression parts of a `switch`
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";

extension type const BoolET1(bool _) {}
extension type const BoolET2(bool _) implements bool {}

String testStatement1(BoolET1 o) {
  switch (o) {
    case (true):
      return "true";
    case (false):
      return "false";
  }
}

String testStatement2(BoolET2 o) {
  switch (o) {
    case (true):
      return "true";
    case (false):
      return "false";
  }
}

String testExpression1(BoolET1 o) => switch (o) {
      (true) => "true",
      (false) => "false"
    };

String testExpression2(BoolET2 o) => switch (o) {
    (true) => "true",
    (false) => "false"
  };

main() {
  Expect.equals("true", testStatement1(BoolET1(true)));
  Expect.equals("false", testStatement1(BoolET1(false)));
  Expect.equals("true", testStatement2(BoolET2(true)));
  Expect.equals("false", testStatement2(BoolET2(false)));

  Expect.equals("true", testExpression1(BoolET1(true)));
  Expect.equals("false", testExpression1(BoolET1(false)));
  Expect.equals("true", testExpression2(BoolET2(true)));
  Expect.equals("false", testExpression2(BoolET2(false)));
}
