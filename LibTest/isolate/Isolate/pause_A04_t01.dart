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
 *   If an isolate is paused using more than one capability, each pause must
 * be individually ended before the isolate resumes.
 *
 * @description Check that if an isolate is paused using more than one
 * capability, each pause must be individually ended before the isolate resumes.
 *
 * @author a.semenov@unipro.ru
 */
import "dart:isolate";
import "dart:async";
import "IsolateUtil.dart";
import "../../../Utils/expect.dart";

Future test(List<Capability> capabilities, List<int> resumePermutation) async {
  List receivedData = [];
  ReceivePort receivePort = new ReceivePort();
  receivePort.listen(
      (data) {
        receivedData.add(data);
      }
  );

  EchoServer server = await EchoServer.spawn(receivePort.sendPort);

  for (Capability resumeCapability in capabilities) {
    server.isolate.pause(resumeCapability);
  }

  for (int index in resumePermutation) {
    // check that isolate is still paused
    server.send(index);
    await new Future.delayed(new Duration(milliseconds:100));
    Expect.equals(0,receivedData.length);

    server.isolate.resume(capabilities[index]);
  }
  // check that isolate is resumed
  server.send(-1);
  resumePermutation.add(-1);

  await server.stop();
  receivePort.close();
  Expect.listEquals(resumePermutation, receivedData);

}

main() {
  List<Capability> capabilities = [
    new Capability(),
    new Capability(),
    new Capability(),
    new Capability(),
    new Capability()
  ];
  asyncStart();
  Future.wait([
    test(capabilities, [0,1,2,3,4]),
    test(capabilities, [4,3,2,1,0]),
    test(capabilities, [3,2,0,1,4]),
    test(capabilities, [2,0,3,4,1])
  ]).then( (_) => asyncEnd());
}
