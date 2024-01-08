// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Exhaustiveness of a variable pattern is determined by the static
/// type of the corresponding variable.
///
/// @description Check that a lifted space union of a variable pattern is a
/// union of the static type of the corresponding variable.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

import "../../Utils/expect.dart";

extension type BoolET1(bool _) {}
extension type BoolET2(bool _) implements bool {}

String test1_1(BoolET1 o) {
  switch (o) {
    case bool _b:
      return "exhaustive";
  }
}

String test1_2(BoolET2 o) {
  switch (o) {
    case bool _b:
      return "exhaustive";
  }
}

String test1_3(BoolET1 o) {
  switch (o) {
    case BoolET1 _b:
      return "exhaustive";
  }
}

String test1_4(BoolET2 o) {
  switch (o) {
    case BoolET2 _b:
      return "exhaustive";
  }
}

String test1_5(BoolET1 o) {
  switch (o) {
    case BoolET2 _b:
      return "exhaustive";
  }
}

String test1_6(BoolET2 o) {
  switch (o) {
    case BoolET1 _b:
      return "exhaustive";
  }
}

String test2_1(BoolET1 o) => switch (o) {
      var v => "exhaustive"
    };

String test2_2(BoolET2 o) => switch (o) {
      var v => "exhaustive"
    };

main() {
  Expect.equals("exhaustive", test1_1(BoolET1(true)));
  Expect.equals("exhaustive", test1_1(BoolET1(false)));
  Expect.equals("exhaustive", test1_2(BoolET2(true)));
  Expect.equals("exhaustive", test1_2(BoolET2(false)));
  Expect.equals("exhaustive", test1_3(BoolET1(true)));
  Expect.equals("exhaustive", test1_3(BoolET1(false)));
  Expect.equals("exhaustive", test1_4(BoolET2(true)));
  Expect.equals("exhaustive", test1_4(BoolET2(false)));
  Expect.equals("exhaustive", test1_5(BoolET1(true)));
  Expect.equals("exhaustive", test1_5(BoolET1(false)));
  Expect.equals("exhaustive", test1_6(BoolET2(true)));
  Expect.equals("exhaustive", test1_6(BoolET2(false)));
  Expect.equals("exhaustive", test2_1(BoolET1(true)));
  Expect.equals("exhaustive", test2_1(BoolET1(false)));
  Expect.equals("exhaustive", test2_2(BoolET2(true)));
  Expect.equals("exhaustive", test2_2(BoolET2(false)));
}
