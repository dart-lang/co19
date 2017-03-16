/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<T> future
 * The future that will contain the result provided to this completer.
 * @description Checks that this property refers to an object of the type Future.
 * @author msyabro
 */
import "../../../Utils/expect.dart";

import "dart:async";

main() {
  Completer completer = new Completer();
  Expect.isTrue(completer.future is Future);
}
