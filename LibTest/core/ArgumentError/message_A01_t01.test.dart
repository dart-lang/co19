/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
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

test(ArgumentError create([value, String name, message])) {
  var msg = "some message";
  ArgumentError err = create(null, null, msg);
  Expect.equals(msg, err.message);
}
