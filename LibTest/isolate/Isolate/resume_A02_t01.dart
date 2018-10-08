/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS
 * file for details. All rights reserved. Use of this source code is governed
 * by a BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void resume(
 *                    Capability resumeCapability
 *                    )
 *    Resumes a paused isolate.
 *    Sends a message to an isolate requesting that it ends a pause that was
 * requested using the resumeCapability.
 *    When all active pause requests have been cancelled, the isolate will
 * continue processing events and handling normal messages.
 *
 * @description Check that isolate continue processing events only after
 * all pause requests are canceled by call to resume()
 *
 * @author a.semenov@unipro.ru
 */
import "dart:isolate";
import "dart:async";
import "../../../Utils/expect.dart";
import "IsolateUtil.dart";

Duration _500MS = new Duration(milliseconds:500);

Future test(List<int> resumePermutation) async {
  ReceivePort receivePort = new ReceivePort();
  EchoServer server = await EchoServer.spawn(receivePort.sendPort);

  Expect.equals("hello", await server.ping("hello"));

  List<Capability> resumeCapability = [];
  resumeCapability.add(server.isolate.pause());
  Expect.equals("timeout", await server.ping("paused0", _500MS, "timeout"));

  for (int i=1; i<resumePermutation.length; i++) {
    resumeCapability.add(server.isolate.pause(new Capability()));
    Expect.equals("timeout", await server.ping("paused$i", _500MS, "timeout"));
  }

  int i = 0;
  while (i<resumePermutation.length-1) {
    server.isolate.resume(resumeCapability[resumePermutation[i]]);
    Expect.equals("timeout", await server.ping("resume$i", _500MS, "timeout"));
    i++;
  }
  server.isolate.resume(resumeCapability[resumePermutation[i]]);
  Expect.equals("resume", await server.ping("resume", _500MS, "timeout"));

  Expect.equals("server", await server.ping("server"));

  await server.stop();
  receivePort.close();
}

main() {
  asyncStart();
  Future.wait([
    test([0,1,2,3,4]),
    test([4,3,2,1,0]),
    test([3,2,0,1,4]),
    test([2,0,3,4,1])
  ]).then( (_) => asyncEnd() );
}
