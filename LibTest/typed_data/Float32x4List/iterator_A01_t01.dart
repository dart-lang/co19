/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterator<E> iterator
 * Returns a new [Iterator] that allows iterating the elements of this
 * [Iterable].
 * @description Checks that the returned [Iterator] iterates over all elements
 * of this [Iterable] object.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float32x4 pack(v) => new Float32x4.splat(v);

equal(obj1, obj2) {
  var res = obj1.equal(obj2);
  return res.flagX && res.flagY && res.flagZ && res.flagW;
}

void checkIterator(List<Float32x4> list) {
  var l = new Float32x4List.fromList(list);
  var it = l.iterator;
  var i = 0;
  while (it.moveNext()) {
    Expect.isTrue(equal(l[i++], it.current));
  }
  Expect.equals(l.length, i);
}

main() {
  checkIterator([]);
  checkIterator([
    pack(1.0), pack(2.0), pack(3.0), pack(4.0), pack(5.0),
    pack(6.0), pack(7.0), pack(8.0), pack(9.0), pack(10.0)
  ]);

  var a = new List<Float32x4>(255);
  for (var i = 0; i < a.length; i++) {
    a[i] = pack(i * 1.0);
  }
  checkIterator(a);
}
