/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final bool isBroadcast
 * Reports whether this stream is a broadcast stream.
 * @description Checks true is returned for a broadcast stream.
 * @author kaigorodov
 */

import "dart:async";
import "dart:isolate";
import "../../../Utils/expect.dart";

main() {
  ReceivePort rp = new ReceivePort();
  Stream s = rp.asBroadcastStream();
  
  Expect.isTrue(s.isBroadcast);
  rp.close();
}
