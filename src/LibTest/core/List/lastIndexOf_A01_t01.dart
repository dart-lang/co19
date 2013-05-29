/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract int lastIndexOf(E element, [int start])
 * Returns the last index of element in the list.
 * Searches the list backwards from index start to 0.
 * The first time an element e is encountered so that e == element,
 * the index of e is returned.
 * @description Checks that the correct index is returned, if the element is present in the list.
 * @author iefremov
 * @reviewer msyabro
 * @reviewer varlax
 */
import "../../../Utils/expect.dart";

main() {
  List a = [42, 0, -1, 42, -1, 6031769, 0];
  Expect.isTrue(a.lastIndexOf(42, 0) == 0);
  Expect.isTrue(a.lastIndexOf(0, 6) == 6);
  Expect.isTrue(a.lastIndexOf(42, 5) == 3);
  Expect.isTrue(a.lastIndexOf(42, 3) == 3);
  Expect.isTrue(a.lastIndexOf(42, 2) == 0);
  Expect.isTrue(a.lastIndexOf(6031769, 5) == 5);
  Expect.isTrue(a.lastIndexOf(6031769, 6) == 5);
  Expect.isTrue(a.lastIndexOf(0, 1) == 1);
  Expect.isTrue(a.lastIndexOf(0, 2) == 1);
  Expect.isTrue(a.lastIndexOf(0, 5) == 1);
  Expect.isTrue(a.lastIndexOf(0, 6) == 6);

  a = const [42, 0, -1, 42, -1, 6031769, 0];
  Expect.isTrue(a.lastIndexOf(42, 0) == 0);
  Expect.isTrue(a.lastIndexOf(0, 6) == 6);
  Expect.isTrue(a.lastIndexOf(42, 5) == 3);
  Expect.isTrue(a.lastIndexOf(42, 3) == 3);
  Expect.isTrue(a.lastIndexOf(42, 2) == 0);
  Expect.isTrue(a.lastIndexOf(6031769, 5) == 5);
  Expect.isTrue(a.lastIndexOf(6031769, 6) == 5);
  Expect.isTrue(a.lastIndexOf(0, 1) == 1);
  Expect.isTrue(a.lastIndexOf(0, 2) == 1);
  Expect.isTrue(a.lastIndexOf(0, 5) == 1);
  Expect.isTrue(a.lastIndexOf(0, 6) == 6);

  List b = new List(10);
  b.setRange(0,a.length,a);
  Expect.isTrue(b.lastIndexOf(42, 0) == 0);
  Expect.isTrue(b.lastIndexOf(0, 6) == 6);
  Expect.isTrue(b.lastIndexOf(42, 5) == 3);
  Expect.isTrue(b.lastIndexOf(42, 3) == 3);
  Expect.isTrue(b.lastIndexOf(42, 2) == 0);
  Expect.isTrue(b.lastIndexOf(6031769, 5) == 5);
  Expect.isTrue(b.lastIndexOf(6031769, 6) == 5);
  Expect.isTrue(b.lastIndexOf(0, 1) == 1);
  Expect.isTrue(b.lastIndexOf(0, 2) == 1);
  Expect.isTrue(b.lastIndexOf(0, 5) == 1);
  Expect.isTrue(b.lastIndexOf(0, 6) == 6);
}
