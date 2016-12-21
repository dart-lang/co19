/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E elementAt(int index)
 * Returns the indexth element.
 * @description Checks that the indexth element is returned.
 * @author msyabro
 */
import "../../../Utils/expect.dart";

main() {
  var list = [0x6a, 0x75, 0x73, 0x74, 0x20, 0x61, 0x20, 0x73, 0x74, 0x72, 0x69,
    0x6e, 0x67];
  var runes = new Runes('just a string');
  for (int i = 0; i < runes.length; ++i) {
    Expect.equals(list[i], runes.elementAt(i));
  }
}
