/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by list
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns whether the [Iterator] has elements left.
 * @description Checks if [Iterator] has elements left.
 * @author msyabro
 */

main() {
  Queue list = new Queue();
  Expect.isFalse(list.iterator().hasNext());
  list.add(0);
  Iterator it = list.iterator();
  Expect.isTrue(it.hasNext());
  it.next();
  Expect.isFalse(it.hasNext());

  list = new Queue();
  for(int i = 0 ; i < 10000; i++) {
    list.add(i);
  }
  it = list.iterator();
  for (var i=0; i < list.length; i++) {
    Expect.isTrue(it.hasNext());
    it.next();
  }
  Expect.isFalse(it.hasNext());

  list.clear();
  it = list.iterator();
  Expect.isFalse(it.hasNext());

  list.add(1);
  it = list.iterator();
  Expect.isTrue(it.hasNext());
}
