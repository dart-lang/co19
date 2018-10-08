/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract int indexOf(E element, [int start = 0])
 * The first time an object o is encountered so that o == element,
 * the index of o is returned.
 * @description Checks searching custom objects.
 * @author varlax
 */
library indexOf_A05_t01;

import "../../../Utils/expect.dart";

checkList(List list, var elem, int expected) {
  Expect.equals(expected, list.indexOf(elem));
}

class Eq {
  bool operator ==(other) => other is Eq;
}

test(List create([int length])) {
  List a = create(10);
  checkList(a, null, 0);
  
  var o = new Object();
  a[4] = o;
  checkList(a, o, 4);

  a[8] = o;
  checkList(a, o, 4);

  Eq e = new Eq();
  a[3] = e;
  checkList(a, new Eq(),3);
}

