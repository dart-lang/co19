/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns whether the [Iterator] has elements left.
 * @description Checks that true is returned only if the [Iterator] has elements left.
 * @author vasya
 * @reviewer msyabro
 * @reviewer varlax
 */

main() {
  Expect.isFalse([].iterator.moveNext());

  List a = new List();
  Expect.isFalse(a.iterator.moveNext());
  a.add(0);
  Iterator it = a.iterator;
  Expect.isTrue(it.moveNext());
  Expect.isFalse(it.moveNext());

  a = new List();
  a.length = 25476;
  it = a.iterator;
  for (var i=0; i < a.length; i++) {
    Expect.isTrue(it.moveNext());
  }
  Expect.isFalse(it.moveNext());

  a.clear();
  it = a.iterator;
  Expect.isFalse(it.moveNext());

  a.length = 1;
  it = a.iterator;
  Expect.isTrue(it.moveNext());

  a = const[];
  it = a.iterator;
  Expect.isFalse(it.moveNext());

  a = const[1];
  it = a.iterator;
  Expect.isTrue(it.moveNext());
}
