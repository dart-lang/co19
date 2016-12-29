/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Runes runes
 * Returns an Iterable of Unicode code-points of this string.
 * ...
 * @description Checks that this property returns an Iterable of Unicode
 * code-points of this string
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  String str = "abc";
  Runes runes = str.runes;
  RuneIterator ri = runes.iterator;
  String res = "";
  while (ri.moveNext()) {
    res += ri.currentAsString;
  }
  Expect.equals(str, res);
}
