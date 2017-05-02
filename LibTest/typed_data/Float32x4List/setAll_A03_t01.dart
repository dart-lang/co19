/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void setAll(int index, Iterable<E> iterable)
 * ...
 * The [iterable] must not have more elements than what can fit from index to
 * length.
 * @description Checks that an error is thrown if the [iterable] is longer than
 * length - index.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float32x4 pack(v) => new Float32x4.splat(v);

main() {
  var l = new Float32x4List.fromList([]);
  Expect.throws(() {
    l.setAll(0, [pack(1.0)]);
  });

  l = new Float32x4List.fromList([pack(1.0), pack(2.0), pack(3.0)]);
  Expect.throws(() {
    l.setAll(0, [pack(1.0), pack(2.0), pack(3.0), pack(4.0)]);
  });

  l = new Float32x4List.fromList([pack(1.0), pack(2.0), pack(3.0)]);
  Expect.throws(() {
    l.setAll(1, [pack(1.0), pack(2.0), pack(3.0)]);
  });

  l = new Float32x4List.fromList([pack(1.0), pack(2.0), pack(3.0)]);
  Expect.throws(() {
    l.setAll(2, [pack(1.0), pack(2.0)]);
  });
}

