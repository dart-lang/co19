/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int start
 * @description Checks that this property always returns 0
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  var indexable = [1, 2, 3];
  IndexError e = new IndexError(12, indexable);
  Expect.equals(0, e.start);


  var indexable2 = "insexable";
  IndexError e2 = new IndexError(12, indexable2);
  Expect.equals(0, e2.start);

  var indexable3 = new Object();
  IndexError e3 = new IndexError(12, indexable3, "", "", 4);
  Expect.equals(0, e3.start);
}
