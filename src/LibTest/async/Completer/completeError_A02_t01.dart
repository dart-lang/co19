/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void completeError(Object exception, [Object stackTrace])
 * The argument exception should not be null.
 * @description
 * @needsreview it's uclear what should happen if exception is null
 * @author ilya
 */

import "dart:async";
//import "../../../Utils/async_utils.dart";

f() {
  var completer = new Completer();
  completer.future.catchError((e) {
    print('future completed with error $e');
  });
  try {
    completer.completeError(null);
  } catch (e) {
    print('synchronous error thrown');
  }
}

main() {
  runZoned(f, onError: (e) {
    print('asynchronous error thrown');
  });
}
