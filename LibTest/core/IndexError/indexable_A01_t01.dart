/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion dynamic indexable
 * @description Checks that this property returns indexable object
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  var indexable = "indexable";
  IndexError e = new IndexError(12, indexable);
  Expect.equals(indexable, e.indexable);

  var indexable2 = [1, 2, 3];
  IndexError e2 = new IndexError(12, indexable2);
  Expect.equals(indexable2, e2.indexable);

  var indexable3 = new Object();
  IndexError e3 = new IndexError(12, indexable3, "", "", 2);
  Expect.equals(indexable3, e3.indexable);
}
