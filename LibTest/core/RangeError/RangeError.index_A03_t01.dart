/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion RangeError.index(int index, indexable,
 *    [String name, String message, int length])
 * ...
 * The length is the length of indexable at the time of the error. If length
 * is omitted, it defaults to indexable.length.
 * ...
 * @description Checks that if If length is omitted, it defaults
 * to indexable.length.
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  RangeError re1 = new RangeError.index(-1, [1, 2, 3]);
  Expect.equals(3, (re1 as IndexError).length);

  RangeError re2 = new RangeError.index(5, []);
  Expect.equals(0, (re2 as IndexError).length);

  RangeError re3 = new RangeError.index(1, [1, 2, 3, 4, 5]);
  Expect.equals(5, (re3 as IndexError).length);

  Expect.throws(() {new RangeError.index(1, null);});
}
