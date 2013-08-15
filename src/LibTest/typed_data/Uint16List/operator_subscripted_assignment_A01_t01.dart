/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void operator []=(int index, int value)
 * Sets the entry at the given index in the list to value.
 * @description Checks that the entry at the given index is set.
 * @author msyabro
 */
import "dart:typed_data";
import "../../../Utils/expect.dart";

check(list) {
  var l = new Uint16List(list.length);
  for(int i = 0; i < list.length; ++i) {
    l[i] = list.elementAt(i);
    Expect.identical(list.elementAt(i), l.elementAt(i));
  }
}

main() {
  check([1]);
  var list = new List(127);
  for(int i = 0; i < 127; ++i) {
    list[i] = i;
  }
  check(list);
}
