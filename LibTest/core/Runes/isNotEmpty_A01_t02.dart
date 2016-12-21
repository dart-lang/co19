/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final bool isNotEmpty
 * Returns true if there is at least one element in this collection.
 * @description Checks that [isNotEmpty] is final and can't be set.
 * @author msyabro
 */
import "../../../Utils/expect.dart";

main() {
  dynamic runes = new Runes('');

  try {
  runes.isNotEmpty = false;
    Expect.fail("[isNotEmpty] should be final");
  } on NoSuchMethodError catch(ok) {}
}
