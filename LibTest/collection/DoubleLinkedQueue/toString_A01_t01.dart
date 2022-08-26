// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion String toString()
/// Returns a string representation of this object.
/// Elements are represented by their own [toString] results.
/// The default representation always contains the first three elements.
/// @description Checks that string representation of this queue always contains
/// representation of its first three elements.
/// @author kaigorodov

import "dart:collection";
import "../../../Utils/expect.dart";

void check(List elements) {
  DoubleLinkedQueue q = new DoubleLinkedQueue.from(elements);
  String rep = q.toString();
  
  Expect.isTrue(rep.contains(elements[0].toString()));
  Expect.isTrue(rep.contains(elements[1].toString()));
  Expect.isTrue(rep.contains(elements[2].toString()));
}

main() {
  check([1, "2", "345", "rfq"]);
  check([null, [null], [], [1, 2, 3], [[null]]]);
  check([1, "2", "345", "rfq"]);
  check([1, new Error(), 25, 4, null, "adc", null, 28, new Error(), 17, 8, 5]);

  List aList = [];
  for(int i = 0; i < 99; i++) aList.add(i);
  check(aList);

  for(int i = 99; i < 500; i++) aList.add(i);
  check(aList);
}
