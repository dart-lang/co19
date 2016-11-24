/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion dynamic message
 * read-only
 * Message describing the problem.
 * @description Checks that message property returns description of the problem
 * @author sgrekhov@unipro.ru
 */

import "../../../Utils/expect.dart";
 
main() {
  var message = "some message";
  ArgumentError err = new ArgumentError.value(null, null, message);
  Expect.equals(message, err.message);
}
