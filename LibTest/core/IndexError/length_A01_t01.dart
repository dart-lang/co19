/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int length
 * @description Checks that this property returns length ot the iterable or
 * constructor argument
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  var indexable = new Object();
  IndexError e = new IndexError(12, indexable, "", "", 17);
  Expect.equals(17, e.length);

  var indexable2 = [0, 1, 2, 3];
  IndexError e2 = new IndexError(12, indexable2);
  Expect.equals(4, e2.length);
}
