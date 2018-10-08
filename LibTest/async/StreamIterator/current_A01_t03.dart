/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion T current
 * The current value of the stream.
 *
 * Is null before the first call to moveNext and after a call to moveNext
 * completes with a false result or an error.
 *
 * When a moveNext call completes with true, the current field holds the most
 * recent event of the stream, and it stays like that until the next call to
 * moveNext. Between a call to moveNext and when its returned future completes,
 * the value is unspecified.
 *
 * @description Checks that the property current returns null after a call to
 * moveNext completes with an error.
 * @author ngl@unipro.ru
 */

import "dart:async";
import "../../../Utils/expect.dart";

main() {
  StreamController c = new StreamController();
  StreamIterator si = new StreamIterator(c.stream);
  asyncStart();
  c.addError(1);

  si.moveNext().catchError((value) {
    Expect.equals(1, value);
    Expect.isNull(si.current);
    asyncEnd();
  });
}
