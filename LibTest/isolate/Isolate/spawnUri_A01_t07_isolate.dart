/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 *  * @author a.semenov@unipro.ru
 */
library spawnUri_A01_t07_isolate;

import "../../../Utils/expect.dart";

void main(List<String> args) {
  Expect.listEquals(["hello", "world"], args);
  print("unittest-suite-success");
}
