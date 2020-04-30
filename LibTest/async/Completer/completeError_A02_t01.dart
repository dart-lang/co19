/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void completeError(Object exception, [Object stackTrace])
 * The error must not be null.
 * @description Checks that the error must not be null.
 * @author ilya
 */

import "dart:async";
import "../../../Utils/expect.dart";

main() {
  var completer = new Completer();
  Expect.throws(() {
    completer.completeError(null);
  });
}
