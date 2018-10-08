/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion StackTrace stackTrace
 * @description Checks that this property is not null if error is thrown
 * @author sgrekhov@unipro.ru
 * @issue 28179
 */
import "../../../Utils/expect.dart";

main() {
  Error e = new StackOverflowError();
  Expect.isNull(e.stackTrace);
  try {
    throw e;
  } on StackOverflowError catch (er) {
    Expect.isNotNull(e.stackTrace);
  }
}
