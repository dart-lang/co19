/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract bool operator ==(other)
 * Tests whether other is an IsolateSink feeding into the same IsolateStream as this one.
 * @description Checks that same sink passed into an isolate twice preserves equality.
 * as an argument.
 * @author kaigorodov
 */
import "dart:async";
import "dart:isolate";
import "../../../Utils/expect.dart";
import "../../../Utils/async_utils.dart";

List<IsolateSink> sinks=new List<Sink>();

void readMsg(message) {
  if (message is SendPort) {
    SendPort replyTo=(message as SendPort);
    if (2!=sinks.length) {
      replyTo.send("bad: ${sinks.length}, ${sinks}");
    } else if (sinks[0]==sinks[1]) {
      replyTo.send("ok");
    } else {
      replyTo.send("not equal");
    }
    replyTo.close();
  } else {
    try {
      sinks.add(message as IsolateSink);
    } catch (e) {
      print("e=$e");
    }
  }
}

void main2() {
  stream.listen(readMsg);
}

main() {
  IsolateSink sink = streamSpawnFunction(main2);
  Expect.equals(sink, sink);
  sink.add(sink);
  sink.add(sink);
  sink.add(port.toSendPort());

  asyncStart();
  port.receive((message, replyTo){
    Expect.equals("ok", message);
    port.close();
    asyncEnd();
  });
}

