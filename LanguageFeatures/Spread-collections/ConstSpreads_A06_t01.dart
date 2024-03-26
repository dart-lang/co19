// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion This enables in-place literals (which aren't very useful):
///   const list = [...["why"]];
///
/// @description Checks that in-place literals are enabled for lists
/// @author iarkh@unipro.ru


import "../../Utils/expect.dart";

main() {
  const res1 = [...["why"]];
  Expect.listEquals(["why"], res1);
  const res2 = [...?["not"]];
//              ^^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
  Expect.listEquals(["not"], res2);

  const res3 = [...{"why"}];
  Expect.listEquals(["why"], res3);
  const res4 = [...?{"not"}];
//              ^^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
  Expect.listEquals(["not"], res4);

  const List aList = const [1, 2, 3];
  const res5 = [1, 2, ...[1, 2, 3], 4, 15, 1, ...[null], ...{12345}, aList];
  Expect.listEquals([1, 2, 1, 2, 3, 4, 15, 1, null, 12345, aList], res5);
  const res6 = [1, 2, 3, ...[4, 5, 6], ...?[7, 8, 9], aList];
//                                     ^^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
  Expect.listEquals([1, 2, 3, 4, 5, 6, 7, 8, 9, aList], res6);

  const Set aSet = {1, 2, 3};
  const res7 = [1, 2, 3, ...[4, 5, 6], ...?{7, 8, 9}, aSet];
//                                     ^^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
  Expect.listEquals([1, 2, 3, 4, 5, 6, 7, 8, 9, aSet], res7);
}
