/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion dynamic message
 * Message describing the problem
 * @description Checks that this property returns message describing the problem
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  var indexable = [1, 2, 3];
  String message = "some message";
  IndexError e = new IndexError(12, indexable, "", message);
  Expect.equals(message, e.message);

  IndexError e2 = new IndexError(12, indexable);
  Expect.equals("Index out of range", e2.message);
}
