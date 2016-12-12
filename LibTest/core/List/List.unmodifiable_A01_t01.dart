/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion List.unmodifiable(Iterable elements)
 * Creates an unmodifiable list containing all elements.
 *
 * The Iterator of elements provides the order of the elements.
 *
 * An unmodifiable list cannot have its length or elements changed. If the
 * elements are themselves immutable, then the resulting list is also immutable.
 * @description Checks that proper list with correct element order is created
 * but cannot ne changed
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  List l = new List.unmodifiable([1, 2, 3, 4, 5]);
  Expect.equals(5, l.length);
  Expect.equals(1, l[0]);
  Expect.equals(2, l[1]);
  Expect.equals(3, l[2]);
  Expect.equals(4, l[3]);
  Expect.equals(5, l[4]);

  Expect.throws(() {l.add(1);});
  Expect.throws(() {l[1] = 1;});
  Expect.throws(() {l.shuffle();});
  Expect.throws(() {l.sort();});
  Expect.throws(() {l.fillRange(0, 2, 1);});
  Expect.throws(() {l.removeLast();});
  Expect.throws(() {l.setAll(1, [1, 2, 3]);});
  Expect.throws(() {l.removeRange(0, 2);});
  Expect.throws(() {l.removeAt(0);});
  Expect.throws(() {l.remove(0);});
  Expect.throws(() {l.removeWhere((e) => true);});
  Expect.throws(() {l.replaceRange(0, 2, [1, 2]);});
  Expect.throws(() {l.clear();});
}
