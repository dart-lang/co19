/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns an [Iterator] that iterates over this [Iterable] object.
 * @description Checks that correctly typed [Iterator] is returned.
 * @author msyabro
 * @reviewer varlax
 */
import "dart:collection";

class A {
  A() {}
}

main() {
  Queue list = new Queue();
  Expect.isTrue(list.iterator is Iterator);

  list = new Queue.from([null]);
  Expect.isTrue(list.iterator is Iterator);

  list = new Queue.from([[]]);
  Expect.isTrue(list.iterator is Iterator);

  list = new Queue<int>();
  Expect.isTrue(list.iterator is Iterator<int>);
  Expect.isFalse(list.iterator is Iterator<bool>);
  Expect.isFalse(list.iterator is Iterator<String>);

  list = new Queue<bool>();
  Expect.isTrue(list.iterator is Iterator<bool>);

  list = new Queue<A>();
  Expect.isTrue(list.iterator is Iterator<A>);
}
