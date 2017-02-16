/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion List<E> sublist(int start, [int end])
 * Returns a new list containing the objects from [start] inclusive to [end]
 * exclusive.
 * @description Checks that it is an error if [end] is less then [start]
 * @author iarkh@unipro.ru
 */
import "dart:collection";
import "../../../Utils/expect.dart";

main() {
  UnmodifiableListView lst = new UnmodifiableListView([0, 1, 2, 3, 4]);

  Expect.throws(() {lst.sublist(3, 2);});
  Expect.throws(() {lst.sublist(1, 0);});
  Expect.throws(() {lst.sublist(4, 3);});
}
