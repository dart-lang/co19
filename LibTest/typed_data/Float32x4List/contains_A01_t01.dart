/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool contains(Object element)
 * Returns true if the collection contains an element equal to [element].
 * @description Checks that true is returned if the collection contains
 * an element equal to [element], false otherwise.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

pack(x, y, z, w) => new Float32x4(x, y, z, w);

main() {
  var l;
  l = new Float32x4List.fromList([]);
  Expect.isFalse(l.contains(pack(.0, .0, .0, .0)));
  Expect.isFalse(l.contains("1"));
  Expect.isFalse(l.contains(new Object()));
  Expect.isFalse(l.contains([]));

  Float32x4 element = pack(0.0, 1.0, 2.0, 3.0);
  l = new Float32x4List.fromList([element]);
  Expect.isFalse(l.contains(pack(.0, .0, .0, .0)));
  Expect.isFalse(l.contains(0.0));
  Expect.isFalse(l.contains("1"));
  Expect.isFalse(l.contains(new Object()));
  Expect.isFalse(l.contains([]));
  Expect.isFalse(l.contains(element));

  Float32x4 e1 = pack(1.0, 0.12, 2.25, -1e-1);
  Float32x4 e2 = pack(2.4e24, -3.01, 3e32, 0.12e-12);
  Float32x4 e3 = pack(-0.001, 8.12e-2, -2.11, 0.234);
  l = new Float32x4List.fromList([e1, e2, e3]);
  Expect.isFalse(l.contains(pack(.0,.0,.0,.0)));
  Expect.isFalse(l.contains(pack(1.0, 0.12, 2.25, -1e-1)));
  Expect.isFalse(l.contains(0));
  Expect.isFalse(l.contains("1"));
  Expect.isFalse(l.contains(new Object()));
  Expect.isFalse(l.contains([]));
  Expect.isFalse(l.contains(e1));
  Expect.isFalse(l.contains(e2));
  Expect.isFalse(l.contains(e3));
}
