/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Maps()
 * @description Checks that Maps object is created
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:collection";

main() {
  Maps maps1 = new Maps();
  Maps maps2 = new Maps();

  Expect.notEquals(maps1, maps2);
}
