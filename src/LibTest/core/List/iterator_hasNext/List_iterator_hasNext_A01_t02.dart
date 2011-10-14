/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns whether the [Iterator] has elements left.
 * @description Tries to check that [Iterator] has elements left when the list
 * is changed.
 * @author vasya
 * @needsreview
 * @reviewer msyabro
 */

main() {
  List a = [0,1,2,3,4,5];
  Iterator it = a.iterator();
  a.length = 2;
  Expect.isTrue(it.hasNext());
  it.next();
  Expect.isTrue(it.hasNext());
  it.next();
  Expect.isFalse(it.hasNext());
}
