/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool contains(Object element)
 * Check whether the collection contains an element equal to element.
 * @description Checks that true is returned if the collection contains
 * an element equal to [element], false otherwise.
 * @author msyabro
 */
import "../../../Utils/expect.dart";

main() {
  var runes;
  runes = new Runes('');
  Expect.isFalse(runes.contains(0));
  Expect.isFalse(runes.contains("1"));
  Expect.isFalse(runes.contains(new Object()));
  Expect.isFalse(runes.contains([]));

  runes = new Runes('a');
  Expect.isFalse(runes.contains(0));
  Expect.isFalse(runes.contains("1"));
  Expect.isFalse(runes.contains(new Object()));
  Expect.isFalse(runes.contains([]));
  Expect.isTrue(runes.contains(0x61));

  runes = new Runes('string');
  Expect.isFalse(runes.contains(0));
  Expect.isFalse(runes.contains("1"));
  Expect.isFalse(runes.contains(new Object()));
  Expect.isFalse(runes.contains([]));
  Expect.isTrue(runes.contains(0x72));
}
