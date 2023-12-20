// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The lifted space union for a pattern with matched value type M is
/// ...
/// Cast pattern:
/// ...
/// Let S be the lifted space union of the cast's subpattern in context C.
/// i. If C is a subset (see below about type subsetting) of S then the result
///   spaces is the lifted space union of M.
/// ii. Otherwise, the result spaces is S plus the lifted space union of Null
///   when C is a non-nullable type, and spaces is S when C is potentially
///   nullable.
///
/// @description Check a lifted space of a cast pattern in case of not sealed
/// type. Test switch statement
/// @author sgrekhov22@gmail.com

import "../../../Utils/expect.dart";

int test(Object obj) {
  switch (obj) {
    case int(isEven: true) as int:
      return 1;
    case int _:
      return 2;
  }
}

main() {
  Expect.equals(2 ,test(1));
  Expect.equals(1 ,test(2));
}
