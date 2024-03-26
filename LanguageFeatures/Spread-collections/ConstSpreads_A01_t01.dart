// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion In a constant list or set, a spread element expands at compile
/// time to the series of elements contained in the spread object list.
///
/// @description Checks that a spread list element expands at compile time to the
/// series of elements contained in the spread object list.
/// @author iarkh@unipro.ru

import "../../Utils/expect.dart";

main() {
  const List list1 = [2, 7, 9];
  const List list2 = ["checkme"];
  const List list3 = [];
  const List? list4 = null;

  const res1 = [...list1];
  Expect.listEquals(list1, res1);
  const res2 = [...?list1];
//              ^^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
  Expect.listEquals(list1, res2);

  const res3 = [...list2];
  Expect.listEquals(list2, res3);
  const res4 = [...?list2];
//              ^^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
  Expect.listEquals(list2, res4);

  const res5 = [...list3];
  Expect.listEquals(list3, res5);
  const res6 = [...?list3];
//              ^^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
  Expect.listEquals(list3, res6);

  const res7 = [...?list4];
  Expect.listEquals([], res7);

  const res8 = [1, 2, ...list1, 6];
  Expect.listEquals([1, 2, 2, 7, 9, 6], res8);

  const res9 = [1, ...list1, ...list2, ...list3, ...?list4, 18];
  Expect.listEquals([1, 2, 7, 9, "checkme", 18], res9);
}
