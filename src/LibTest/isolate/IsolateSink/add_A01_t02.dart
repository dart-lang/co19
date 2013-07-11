/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract void add(message)
 * Sends an asynchronous message to the linked IsolateStream.
 * The message is copied to the receiving isolate.
 * The content of message can be: primitive values (null, num, bool, double, String),
 * instances of IsolateSinks, and lists and maps whose elements are any of these.
 
 * List and maps are also allowed to be cyclic.
 
 * In the special circumstances when two isolates share the same code and are running
 * in the same process (e.g. isolates created via spawnFunction),
 * it is also possible to send object instances (which would be copied in the process).
 * This is currently only supported by the dartvm.
 * For now, the dart2js compiler only supports the restricted messages described above.
 
 * @description Checks that various lists could be sent properly.
 * @author kaigorodov
 */
import "dart:async";
import "dart:isolate";
import "../../../Utils/expect.dart";
import "../../../Utils/async_utils.dart";
//import "add_A01_util.dart";

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

