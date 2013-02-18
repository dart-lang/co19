/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns the number of elements in this collection.
 * @description Checks that the getter returns correct value.
 * @author iefremov
 * @reviewer msyabro
 * @reviewer varlax
 */
import "../../../Utils/expect.dart";


main() {
  Expect.isTrue([].length == 0);
  Expect.isTrue(new List().length == 0);
  Expect.isTrue(new List(0).length == 0);
  Expect.isTrue(new List(100).length == 100);
  Expect.isTrue([null].length == 1);
  Expect.isTrue([null, null].length == 2);
  Expect.isTrue(new List.from([0, 1, 2, 3]).length == 4);
  //List a = const [null];
  List b = const[const [null]];
  Expect.isTrue(b.length == 1);
}
