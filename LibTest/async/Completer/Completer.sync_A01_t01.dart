/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Completer.sync()
 * Completes the future synchronously.
 * @description Checks that [complete] on object created by Completer.sync()
 * indeed completes the future synchronously.
 * @author msyabro
 */

import "dart:async";
import "../../../Utils/expect.dart";

const cv = "done";

main() {
  Completer completer = new Completer.sync();
  Future f = completer.future;
  var value;
  f.then((v) {value = v;});
  completer.complete(cv);
  Expect.identical(cv, value);
}
