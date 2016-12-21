/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> skipWhile(bool test(E element))
 * Once an element does not satisfy the [test] the iterator
 * stops testing and uses every later element unconditionally.
 * @description Checks that once an element does not satisfy
 * the [test] every later element is used unconditionally.
 * @author msyabro
 */
import "../../../Utils/expect.dart";

main() {
  var runes = new Runes('aabaaa');
  var res = runes.skipWhile((e) => e == 0x61);
  Expect.equals(4, res.length);
  for(int i = 1; i < 4; ++i) {
    Expect.equals(0x61, res.elementAt(i));
  }
}
