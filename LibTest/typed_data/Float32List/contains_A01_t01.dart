/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool contains(Object element)
 * Returns true if the collection contains an element equal to element.
 * This operation will check each element in order for being equal to element,
 * unless it has a more efficient way to find an element equal to element.
 * @description Checks that true is returned if the collection contains an
 * element equal to [element], false otherwise.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var l;
  l = new Float32List.fromList([]);
  Expect.isFalse(l.contains(0.0));
  Expect.isFalse(l.contains("1"));
  Expect.isFalse(l.contains(new Object()));
  Expect.isFalse(l.contains([]));

  l = new Float32List.fromList([1.0]);
  Expect.isFalse(l.contains(0.0));
  Expect.isFalse(l.contains("1"));
  Expect.isFalse(l.contains(new Object()));
  Expect.isFalse(l.contains([]));
  Expect.isTrue(l.contains(1.0));

  l = new Float32List.fromList([1.0, 2.0, 3e4, 4.0, 5.0]);
  Expect.isFalse(l.contains(0));
  Expect.isFalse(l.contains("1"));
  Expect.isFalse(l.contains(new Object()));
  Expect.isFalse(l.contains([]));
  Expect.isTrue(l.contains(3e4));
}
