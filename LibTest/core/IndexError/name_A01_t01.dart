/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String name
 * Name of the invalid argument, if available.
 * @description Checks that this property returns Name of the invalid argument,
 * if available.
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  var indexable = [1, 2, 3];
  String name = "name";
  IndexError e = new IndexError(12, indexable, name);
  Expect.equals(name, e.name);

  IndexError e2 = new IndexError(12, indexable);
  Expect.isNull(e2.name);
}
