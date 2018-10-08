/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion StackTrace stackTrace
 * @description Checks that this property returns stack trace when thrown and
 * null when not
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  try {
    var indexable = [1, 2, 3];
    IndexError err = new IndexError(12, indexable);
    Expect.isNull(err.stackTrace);
    throw err;
  } on IndexError catch (e) {
    Expect.isNotNull(e.stackTrace);
  }
}
