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
/// @issue 54460

// SharedOptions=--enable-experiment=inline-class

import "../../Utils/expect.dart";

extension type ObjectET1(Object _) {}
extension type ObjectET2(Object _) implements Object {}

extension type IntET1(int _) {}
extension type IntET2(int _) implements int {}

int test1_1(ObjectET1 obj) {
  switch (obj) {
    case int(isEven: true) as int:
      return 1;
    case int _:
      return 2;
  }
}

int test1_2(ObjectET2 obj) {
  switch (obj) {
    case int(isEven: true) as int:
      return 1;
    case int _:
      return 2;
  }
}

int test2_1(Object obj) {
  switch (obj) {
    case int(isEven: true) as IntET1:
      return 1;
    case int _:
      return 2;
  }
}

int test2_2(Object obj) {
  switch (obj) {
    case int(isEven: true) as IntET2:
      return 1;
    case int _:
      return 2;
  }
}

int test3_1(ObjectET1 obj) {
  switch (obj) {
    case IntET2(isEven: true) as IntET1:
      return 1;
    case int _:
    return 2;
  }
}

int test3_2(ObjectET2 obj) {
  switch (obj) {
    case IntET2(isEven: true) as int:
      return 1;
    case IntET1 _:
      return 2;
  }
}

main() {
  Expect.equals(2 ,test1_1(ObjectET1(1)));
  Expect.equals(1 ,test1_1(ObjectET1(2)));
  Expect.equals(2 ,test1_2(ObjectET2(1)));
  Expect.equals(1 ,test1_2(ObjectET2(2)));

  Expect.equals(2 ,test2_1(1));
  Expect.equals(1 ,test2_1(2));
  Expect.equals(2 ,test2_2(1));
  Expect.equals(1 ,test2_2(2));

  Expect.equals(2 ,test3_1(ObjectET1(1)));
  Expect.equals(1 ,test3_1(ObjectET1(2)));
  Expect.equals(2 ,test3_2(ObjectET2(1)));
  Expect.equals(1 ,test3_2(ObjectET2(2)));
}
