/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void completeError(Object exception, [Object stackTrace])
 * The argument exception should not be null.
 * @description Checks that an error is thrown if exception is null.
 * @author ilya
 */

import "dart:async";
import "../../../Utils/expect.dart";

main() {
  var completer = new Completer();

  completer.future
    .then((_) {
      Expect.fail('should not complete with a value');
    })
    .catchError((_) {
      Expect.fail('should not complete with an error');
    });

  Expect.throws(() => completer.completeError(null));
}
