/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns an [Iterator] that iterates over this [Iterable] object.
 * @description Checks that [Iterator] is returned.
 * @author vasya
 * @reviewer msyabro
 */

class A {
  A() {}
}

main() {
  Expect.isTrue([].iterator() is Iterator);

  Expect.isTrue(new List(null).iterator() is Iterator);

  List a = new List(0);
  Expect.isTrue(a.iterator() is Iterator<Object>);

  a = new List<int>(10);
  Expect.isTrue(a.iterator() is Iterator<int>);
  Expect.isFalse(a.iterator() is Iterator<bool>);
  Expect.isFalse(a.iterator() is Iterator<String>);

  a = new List<bool>();
  Expect.isTrue(a.iterator() is Iterator<bool>);

  a = new List<String>(1);
  Expect.isTrue(a.iterator() is Iterator<String>);

  a = new List<A>(1000);
  Expect.isTrue(a.iterator() is Iterator<A>);

  a = new List<List>(5);
  Expect.isTrue(a.iterator() is Iterator<List>);
}
