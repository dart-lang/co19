/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final Object message;
 * Message describing the assertion error
 * @description Checks that this property returns correct value
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  UnsupportedError ue = new UnsupportedError("test");
  Expect.equals("test", ue.message);

  UnsupportedError ue2 = new UnsupportedError("test2");
  Expect.equals("test2", ue2.message);
}
