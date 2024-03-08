// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Relational pattern doesn't take part in the calculating of the
/// exhaustiveness
///
/// @description Check that relational pattern doesn't take part in the
/// calculating of the exhaustiveness. Test the case when expression in
/// a `switch` are extension types
/// @author sgrekhov22@gmail.com

extension type const BoolET1(bool _) {}
extension type const BoolET2(bool _) implements bool {}

String testStatement1(BoolET1 b) {
  switch (b) {
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    case == true:
      return "true";
    case == false:
      return "false";
  }

}

String testStatement2(BoolET2 b) {
  switch (b) {
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    case == true:
      return "true";
    case == false:
      return "false";
  }
}

String testExpression1(BoolET1 b) => switch (b) {
//                                   ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      == true => "true",
      == false => "false"
    };

String testExpression2(BoolET2 b) => switch (b) {
//                                   ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      == true => "true",
      == false => "false"
    };

main() {
  testStatement1(BoolET1(true));
  testStatement2(BoolET2(false));
  testExpression1(BoolET1(false));
  testExpression2(BoolET2(true));
}
