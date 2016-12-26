/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String message
 * read-only
 * @description Checks that this property returns correct value
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  StateError se = new StateError("State error");
  Expect.equals("State error", se.message);

  StateError se2 = new StateError("");
  Expect.equals("", se2.message);

  StateError se3 = new StateError(null);
  Expect.equals(null, se3.message);
}
