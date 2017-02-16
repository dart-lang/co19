/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion List<E> sublist(int start, [int end])
 * Returns a new list containing the objects from [start] inclusive to [end]
 * exclusive.
 * @description Checks that this method returns a new list containing the
 * objects from [start] inclusive to [end] exclusive
 * @author iarks@unipro.ru
 */
import "dart:collection";
import "../../../Utils/expect.dart";

main() {
  UnmodifiableListView lst = new UnmodifiableListView([0, 1, 2, 3, 4]);
  List sub = lst.sublist(2, 5);

  Expect.equals(3, sub.length);
  Expect.equals(2, sub[0]);
  Expect.equals(3, sub[1]);
  Expect.equals(4, sub[2]);

  sub = lst.sublist(2, 3);
  Expect.equals(1, sub.length);
  Expect.equals(2, sub[0]);
}
