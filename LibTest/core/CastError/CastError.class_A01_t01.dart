/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Error thrown by the runtime system when a cast operation fails.
 * @description Checks that CastError is thrown by runtime when cast operation
 * fails
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  int counter = 0;
  dynamic x = "1";
  try {
    dynamic y = x as int;
  } on CastError {
    counter++;
  } catch (e) {
    Expect.fail("Wrong exception is thrown: " + e.toString());
  }
  Expect.equals(1, counter);
}
