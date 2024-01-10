// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Null-assert pattern is exhausted if a of the subpattern and a
/// type Null is exhausted.
///
/// @description Check that a null-assert pattern is exhausted if a of the
/// subpattern and a type `Null` is exhausted. Test switch expression
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

import "../../Utils/expect.dart";

extension type const ObjectET1(Object _) {}
extension type const ObjectET2(Object _) implements Object {}

String test1(Object? o) => switch (o) {
      ObjectET1 _! => "exhaustive"
    };

String test2(Object? o) => switch (o) {
      ObjectET2 _! => "exhaustive"
    };

String test3(ObjectET1? o) => switch (o) {
      Object _! => "exhaustive"
    };

String test4(ObjectET2? o) => switch (o) {
      Object _! => "exhaustive"
    };

String test5(ObjectET1? o) => switch (o) {
      ObjectET1 _! => "exhaustive"
    };

String test6(ObjectET2? o) => switch (o) {
      ObjectET2 _! => "exhaustive"
    };

String test7(ObjectET1? o) => switch (o) {
      ObjectET2 _! => "exhaustive"
    };

String test8(ObjectET2? o) => switch (o) {
      ObjectET1 _! => "exhaustive"
    };

main() {
  Expect.equals("exhaustive" ,test1(true));
  Expect.equals("exhaustive" ,test2(42));
  Expect.equals("exhaustive" ,test3(ObjectET1(true)));
  Expect.equals("exhaustive" ,test4(ObjectET2(42)));
  Expect.equals("exhaustive" ,test5(ObjectET1(true)));
  Expect.equals("exhaustive" ,test6(ObjectET2(42)));
  Expect.equals("exhaustive" ,test7(ObjectET1(true)));
  Expect.equals("exhaustive" ,test8(ObjectET2(42)));

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
