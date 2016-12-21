/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final bool isEmpty
 * Returns true if there is no element in this collection.
 * @description Checks that this method returns true iff [this] has no elements.
 * @author msyabro
 */
import "../../../Utils/expect.dart";

main() {
  var empty_runes = new Runes('');
  Expect.isTrue(empty_runes.isEmpty);

  var runes = new Runes('12345');
  Expect.isFalse(runes.isEmpty);
}
