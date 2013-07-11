/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion undocumented
 * @description Checks that method throws an exception when given an URI that points
 * to a script that doesn't declare any top-level functions.
 * @author iefremov
 * @needsreview documentation looks incomplete
 TODO file a bug
 */
import "dart:isolate";
import "../../../Utils/expect.dart";

main() {
  SendPort send_port = spawnUri("spawnUri_A02_t02_bad_isolate.dart");
//  Expect.throws(() => spawnUri("spawnUri_A02_t02_bad_isolate.dart"));
  send_port.send("isolate1", port.toSendPort());
  Expect.fail("spawnUri(bad library does not gives an error");
}
