/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion AssertionError([message)
 * @description Checks that AssertionError([message) constructor can be called
 * without any issues with [message] argument specified
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  AssertionError e = new AssertionError("Some message");
  Expect.equals("Some message", e.message);
}
