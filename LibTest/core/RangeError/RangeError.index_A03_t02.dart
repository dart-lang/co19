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
 * @description Checks that if If length is specified then it is used
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  RangeError re1 = new RangeError.index(-1, [1, 2, 3], "", "", 12);
  Expect.equals(12, (re1 as IndexError).length);

  RangeError re2 = new RangeError.index(5, [], "", "", 4);
  Expect.equals(4, (re2 as IndexError).length);

  RangeError re3 = new RangeError.index(1, [1, 2, 3, 4, 5], "", "", -2);
  Expect.equals(-2, (re3 as IndexError).length);

  RangeError re4 = new RangeError.index(1, null, null, null, 17);
  Expect.equals(17, (re4 as IndexError).length);
}
