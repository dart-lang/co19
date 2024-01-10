// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Null-assert pattern is exhausted if a of the subpattern and a
/// type Null is exhausted.
///
/// @description Check that a null-assert pattern is exhausted if a of the
/// subpattern and a type `Null` is exhausted. Test switch statement
/// @author sgrekhov22@gmail.com


// SharedOptions=--enable-experiment=inline-class

import "../../Utils/expect.dart";

extension type const BoolET1(bool _) {}
extension type const BoolET2(bool _) implements bool {}

String test1(bool? o) {
  switch (o) {
    case BoolET1 _!:
      return "exhaustive";
  }
}

String test2(bool? o) {
  switch (o) {
    case BoolET2 _!:
      return "exhaustive";
  }
}

String test3(BoolET1? o) {
  switch (o) {
    case bool _!:
      return "exhaustive";
  }
}

String test4(BoolET2? o) {
  switch (o) {
    case bool _!:
      return "exhaustive";
  }
}

String test5(BoolET1? o) {
  switch (o) {
    case BoolET1 _!:
      return "exhaustive";
  }
}

String test6(BoolET2? o) {
  switch (o) {
    case BoolET2 _!:
      return "exhaustive";
  }
}

String test7(BoolET1? o) {
  switch (o) {
    case BoolET2 _!:
      return "exhaustive";
  }
}

String test8(BoolET2? o) {
  switch (o) {
    case BoolET1 _!:
      return "exhaustive";
  }
}

main() {
  Expect.equals("exhaustive" ,test1(true));
  Expect.equals("exhaustive" ,test2(false));
  Expect.equals("exhaustive" ,test3(BoolET1(true)));
  Expect.equals("exhaustive" ,test4(BoolET2(false)));
  Expect.equals("exhaustive" ,test5(BoolET1(true)));
  Expect.equals("exhaustive" ,test6(BoolET2(false)));
  Expect.equals("exhaustive" ,test7(BoolET1(true)));
  Expect.equals("exhaustive" ,test8(BoolET2(false)));

  Expect.throws(() {
    test1(null);
  });
  Expect.throws(() {
    test2(null);
  });
  Expect.throws(() {
    test3(null);
  });
  Expect.throws(() {
    test4(null);
  });
  Expect.throws(() {
    test5(null);
  });
  Expect.throws(() {
    test6(null);
  });
  Expect.throws(() {
    test7(null);
  });
  Expect.throws(() {
    test8(null);
  });
}
