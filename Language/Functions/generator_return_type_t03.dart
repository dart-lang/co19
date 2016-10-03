/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static warning if the declared return type of a function
 * marked sync* may not be assigned to Iterable. It is a static warning if
 * the declared return type of a function marked async* may not be assigned
 * to Stream.
 *
 * @description Check that it is no compile error, if the declared
 * return type of synchronous generator function may be assigned
 * to Iterable.
 *
 * @issue 27468
 * @author a.semenov@unipro.ru
 */

class TestItearble<E> extends Iterable<E> {

  @override
  Iterator<E> get iterator => null;
}

TestItearble c() sync* { }

main() {
  Iterable i = new TestItearble();
  c();
}
