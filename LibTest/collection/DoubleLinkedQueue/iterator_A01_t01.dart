// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion final _DoubleLinkedQueueIterator<E> iterator
/// Returns an [Iterator] that iterates over this Iterable object.
/// @description Checks that correctly typed [Iterator] is returned.
/// @author kaigorodov

import "../../../Utils/expect.dart";
import "dart:collection";

class A {
  A() {}
}

main() {
  Queue list = new DoubleLinkedQueue();
  Expect.isTrue(list.iterator is Iterator);
  Expect.runtimeIsType<Iterator>(list.iterator);

  list = new DoubleLinkedQueue.from([null]);
  Expect.isTrue(list.iterator is Iterator);
  Expect.runtimeIsType<Iterator>(list.iterator);

  list = new DoubleLinkedQueue.from([[]]);
  Expect.isTrue(list.iterator is Iterator);
  Expect.runtimeIsType<Iterator>(list.iterator);

  list = new DoubleLinkedQueue<int>();
  Expect.isTrue(list.iterator is Iterator<int>);
  Expect.isFalse(list.iterator is Iterator<bool>);
  Expect.isFalse(list.iterator is Iterator<String>);
  Expect.runtimeIsType<Iterator<int>>(list.iterator);
  Expect.runtimeIsNotType<Iterator<bool>>(list.iterator);
  Expect.runtimeIsNotType<Iterator<String>>(list.iterator);

  list = new DoubleLinkedQueue<bool>();
  Expect.isTrue(list.iterator is Iterator<bool>);
  Expect.runtimeIsType<Iterator<bool>>(list.iterator);

  list = new DoubleLinkedQueue<A>();
  Expect.isTrue(list.iterator is Iterator<A>);
  Expect.runtimeIsType<Iterator<A>>(list.iterator);
}
