/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Adds [value] at the end of the list, extending the length by one.
 * @description Checks that method does not affect previous elements of the list.
 * @author vasya
 * @reviewer msyabro
 * @reviewer varlax
 */
import "../../../Utils/expect.dart";

main() {
  List a = new List();
  a.addLast("1");
  Expect.listEquals(["1"], a);
  a.addLast("2");
  Expect.listEquals(["1", "2"], a);
  Expect.equals(a[1], "2");

  a = new List();
  a.addLast(null);
  Expect.listEquals([null], a);
  Expect.equals(a[0], null);
  a.addLast("");
  Expect.listEquals([null, ""], a);
  Expect.equals(a[1], "");
  a.addLast(0);
  Expect.listEquals([null, "", 0], a);
  Expect.equals(a[2], 0);

  a = new List.from([]);
  List b = [null];
  a.addLast(b);
  Expect.equals(a[0], b);
  Expect.listEquals([b], a);
  List c = [];
  a.addLast(c);
  Expect.listEquals([b, c], a);

  a = [];
  a.addLast(b);
  Expect.equals(a[0], b);
  Expect.listEquals([b], a);
  a.addLast(c);
  Expect.listEquals([b, c], a);
}
