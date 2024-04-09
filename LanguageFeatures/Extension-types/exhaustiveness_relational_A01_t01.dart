// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Relational pattern doesn't take part in the calculating of the
/// exhaustiveness
///
/// @description Check that relational pattern doesn't take part in the
/// calculating of the exhaustiveness. Test the case when constants in
/// relational patterns are extension types
/// @author sgrekhov22@gmail.com
/// @issue 54506

extension type const BoolET1(bool _) {}
extension type const BoolET2(bool _) implements bool {}

const True1 = BoolET1(true);
const False1 = BoolET1(false);
const True2 = BoolET2(true);
const False2 = BoolET2(false);

String testStatement1(bool b) {
  switch (b) {
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    case == True1:
      return "true";
    case == False1:
      return "false";
  }
}

String testStatement2(bool b) {
  switch (b) {
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    case == True2:
      return "true";
    case == False2:
      return "false";
  }
}

String testExpression1(bool b) => switch (b) {
//                                ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      == True1 => "true",
      == False1 => "false"
    };

String testExpression2(bool b) => switch (b) {
//                                ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      == True2 => "true",
      == False2 => "false"
    };

main() {
  testStatement1(true);
  testStatement2(false);
  testExpression1(true);
  testExpression2(false);
}
