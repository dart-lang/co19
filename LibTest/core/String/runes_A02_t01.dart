/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Runes runes
 * ...
 * If the string contains surrogate pairs, they are combined and returned as one
 * integer by this iterator. Unmatched surrogate halves are treated like valid
 * 16-bit code-units.
 * @description Checks that if the string contains surrogate pairs, they are
 * combined and returned as one integer by this iterator
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  String clef = '\u{1D11E}';
  Expect.equals(1, clef.runes.toList().length);
  Expect.equals(119070, clef.runes.toList()[0]);
}
