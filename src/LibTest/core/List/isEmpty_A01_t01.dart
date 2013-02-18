/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns true if there is no element in the list.
 * @description Checks various lists, that the method returns true if there is no elements,
 * in the list, false otherwise.
 * @author vasya
 * @reviewer iefremov
 * @reviewer varlax
 */
import "../../../Utils/expect.dart";


main() {
  Expect.isTrue([].isEmpty);
  Expect.isFalse([null].isEmpty);
  Expect.isFalse(const[0,1,2,3,4].isEmpty);
  Expect.isFalse([[]].isEmpty);

  Expect.isTrue(new List.from([]).isEmpty);
  Expect.isFalse(new List.from([[]]).isEmpty);

  List a = new List(0);
  Expect.isTrue(a.isEmpty);
  a = new List(469);
  Expect.isFalse(a.isEmpty);
}
