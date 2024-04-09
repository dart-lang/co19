// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If the constant has no primitive equality, then it is not
/// exhausted
///
/// @description Check that if a constant does not have primitive equality
/// then it is not exhausted
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";

class C {
  final bool v;
  const C(this.v);

  bool operator ==(covariant bool other) => v == other;
}

extension type const CET(C _) {}

const True = CET(C(true));
const False = CET(C(false));

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
