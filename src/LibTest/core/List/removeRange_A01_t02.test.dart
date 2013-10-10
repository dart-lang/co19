/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract void removeRange(int start, int end)
 * Removes the elements in the range start to end exclusive.
 * @description Checks that list is not changed if [start]==[end].
 * @author vasya
 * @reviewer varlax
 */
import "../../../Utils/expect.dart";

main() {
  var a = new List();
  a.removeRange(0, 0);
  Expect.equals(0, a.length);

  a.length = 11;
  a.removeRange(10, 10);
  Expect.equals(11, a.length);
  a.removeRange(1, 1);
  Expect.equals(11, a.length);

  a.length = 1025;
  a.removeRange(1025, 1025);
  Expect.equals(1025, a.length);

  //[]
  a = [];
  a.length = 11;
  a.removeRange(10, 10);
  Expect.equals(11, a.length);
  a.removeRange(1, 1);
  Expect.equals(11, a.length);

  a.length = 1026;
  a.removeRange(1026, 1026);
  Expect.equals(1026, a.length);

  //List.from([])
  a = new List.from([]);
  a.length = 11;
  a.removeRange(10, 10);
  Expect.equals(11, a.length);
  a.removeRange(1, 1);
  Expect.equals(11, a.length);

  a.length = 1026;
  a.removeRange(1026, 1026);
  Expect.equals(1026, a.length);
}
