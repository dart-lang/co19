/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract int indexOf(E element, [int start = 0])
 * Returns the first index of element in the list.
 * Searches the list from index start to the length of the list.
 * The first time an element e is encountered so that e == element,
 * the index of e is returned. Returns -1 if element is not found.
 * @description Checks that the correct index is returned, if the element
 * is present.
 * @author iefremov
 * @author varlax
 */
library indexOf_A01_t01;

import "../../../Utils/expect.dart";

test(List create([int length])) {
  List a = create();
  a.addAll(const [42, 0, -1, 42, -1, 6031769, 0]);
    
  Expect.isTrue(a.indexOf(42, 0) == 0);
  Expect.isTrue(a.indexOf(0, 0) == 1);
  Expect.isTrue(a.indexOf(42, 1) == 3);
  Expect.isTrue(a.indexOf(42, 3) == 3);
  Expect.isTrue(a.indexOf(6031769, 5) == 5);
  Expect.isTrue(a.indexOf(6031769, 0) == 5);
  Expect.isTrue(a.indexOf(0, 1) == 1);
  Expect.isTrue(a.indexOf(0, 2) == 6);
  Expect.isTrue(a.indexOf(0, 5) == 6);
  Expect.isTrue(a.indexOf(0, 6) == 6);

  List b = create(a.length);
  for(var i = 0; i<a.length; i++) {
    b[i] = a[i];
  }

  Expect.isTrue(b.indexOf(42, 0) == 0);
  Expect.isTrue(b.indexOf(0, 0) == 1);
  Expect.isTrue(b.indexOf(42, 1) == 3);
  Expect.isTrue(b.indexOf(42, 3) == 3);
  Expect.isTrue(b.indexOf(6031769, 5) == 5);
  Expect.isTrue(b.indexOf(6031769, 0) == 5);
  Expect.isTrue(b.indexOf(0, 1) == 1);
  Expect.isTrue(b.indexOf(0, 2) == 6);
  Expect.isTrue(b.indexOf(0, 5) == 6);
  Expect.isTrue(b.indexOf(0, 6) == 6);
}
