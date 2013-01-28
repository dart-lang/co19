/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void completeError(Object exception, [Object stackTrace])
 * The argument exception should not be null.
 * @description Checks that a runtime error is thrown if [exception] is [:null:].
 * @runtime-error
 * @author kaigorodov
 */

import "dart:async";

main() {
  var completer = new Completer();
  completer.completeError(null);
}
