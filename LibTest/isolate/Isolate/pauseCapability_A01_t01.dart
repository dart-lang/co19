/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS
 * file for details. All rights reserved. Use of this source code is governed
 * by a BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Capability pauseCapability
 *    read-only
 *    Capability granting the ability to pause the isolate.
 *    This capability is used by pause. If the capability is not the correct
 * pause capability of the isolate, including if the capability is null,
 * then calls to pause will have no effect.
 *
 * @description Check that pauseCapability is not null, if isolate is started
 * by method spawn() without paused state
 *
 * @author a.semenov@unipro.ru
 */
import "../../../Utils/expect.dart";
import "IsolateUtil.dart";

test() async {
  ErrorServer server = await ErrorServer.spawn();
  Expect.isNotNull(server.isolate.pauseCapability);
  // clean up
  await server.stop();
  asyncEnd();
}

main() {
  asyncStart();
  test();
}
