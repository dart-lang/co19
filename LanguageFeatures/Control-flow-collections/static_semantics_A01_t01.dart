/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let the element type of a list literal be the static type of the
 * type argument used to create the list. So <int>[] has an element type of int.
 * It may be explicit or filled in by type inference. So [1, 2.0] has an element
 * type of num.
 *
 * @description Checks that element type of the list literals is the static type
 * of the type argument used to create the list
 * @author sgrekhov@unipro.ru
 */
import "../../Utils/expect.dart";

main() {
  bool b = true;
  var collection = [3, 1, 4, 1, 5];

  List<int> list1 = [
    if (b) 1,
    if (!b) 2,
    if (b) for (var v in collection) if (v.isOdd) v,
    for (int i = 5; i < 10; i++) i
  ];
  Expect.isTrue(list1 is List<int>);

  var list2 = <int>[
    if (b) 1,
    if (!b) 2,
    if (b) for (var v in collection) if (v.isOdd) v,
    for (int i = 5; i < 10; i++) i
  ];
  Expect.isTrue(list2 is List<int>);

  var list3 = [
    if (b) 1.0,
    if (!b) 2,
    if (b) for (var v in collection) if (v.isOdd) v,
    for (int i = 5; i < 10; i++) i
  ];
  Expect.isTrue(list3 is List<num>);
  Expect.isFalse(list3 is List<int>);

  const list4 = [
    if (2 > 1) 1.0,
    if (1 > 2) 2,
    3
  ];
  Expect.isTrue(list4 is List<num>);
  Expect.isFalse(list4 is List<int>);

  var list5 = const [
    if (2 > 1) 1.0,
    if (1 > 2) "2",
    3
  ];
  Expect.isTrue(list5 is List<Object>);
  Expect.isFalse(list5 is List<num>);
}
