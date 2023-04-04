// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The lifted space union for a pattern with matched value type M is
/// ...
/// Null-assert pattern: A union of the lifted space union of the subpattern and
/// a space with type Null.
///
/// @description Check that a null-assert's pattern space is a union of the
/// lifted space union of the subpattern and a space with type `Null`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../../Utils/expect.dart";

String test1(Object? o) {
  switch (o) {
    case Object _!:
      return "exhaustive";
  }
}

String test2(Object? o) => switch (o) {
      Object _! => "exhaustive"
    };

main() {
  Expect.equals("exhaustive" ,test1(42));
  Expect.equals("exhaustive" ,test2(42));
  Expect.throws(() {
    test1(null);
  });
  Expect.throws(() {
    test2(null);
  });
}
