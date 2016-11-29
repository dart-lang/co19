/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion CyclicInitializationError([String variableName])
 * @description Checks that this constructor can be called without parameter
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  CyclicInitializationError e = new CyclicInitializationError();
  Expect.isNull(e.variableName);
}
