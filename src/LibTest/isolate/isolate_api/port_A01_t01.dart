/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final ReceivePort port
 * The initial ReceivePort available by default for this isolate. 
 * This ReceivePort is created automatically and it is commonly used to establish 
 * the first communication between isolates (see spawnFunction and spawnUri).
 * @description Checks that the value returned by this getter is not null and is
 * indeed an instance of ReceivePort.
 * @author rodionov
 * @note the necessity of closing the port is undocumented, see http://code.google.com/p/dart/issues/detail?id=5673
 */
import "../../../Utils/expect.dart";

import "dart:isolate";

main() {
  Expect.isTrue(port != null);
  Expect.isTrue(port is ReceivePort);
  port.close();
}
