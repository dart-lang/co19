/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion UnsupportedError(String message)
 * @description Checks that this constructor executes without error with various
 * arguments.
 * @author rodionov, sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  UnsupportedError ue = new UnsupportedError(null);
  Expect.isNull(ue.message);

  ue = new UnsupportedError("");
  Expect.equals("", ue.message);

  ue = new UnsupportedError("11");
  Expect.equals("11", ue.message);
}
