/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS
 * file for details. All rights reserved. Use of this source code is governed
 * by a BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Capability pause([
 *    Capability resumeCapability
 * ])
 * ...
 *   If resumeCapability is provided, it is used to identity the pause, and
 * must be used again to end the pause using resume. Otherwise a new resume
 * capability is created and returned.
 *
 * @description Check that pause() without an argument creates and returns
 * new resume capability.
 *
 * @author a.semenov@unipro.ru
 */
import "dart:isolate";
import "IsolateUtil.dart";
import "../../../Utils/expect.dart";

test() async {
  ErrorServer server = await ErrorServer.spawn();
  Capability resumeCapability = server.isolate.pause();
  Expect.isNotNull(resumeCapability);
  server.isolate.resume(resumeCapability);
  await server.stop();
  asyncEnd();
}

main() {
  asyncStart();
  test();
}
