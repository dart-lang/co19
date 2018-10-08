/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS
 * file for details. All rights reserved. Use of this source code is governed
 * by a BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void ping(
 *      SendPort responsePort, {
 *      Object response,
 *      int priority: IMMEDIATE
 * })
 *    Request that the isolate send response on the responsePort.
 *    If the isolate is alive, it will eventually send response (defaulting
 * to null) on the response port.
 *    The priority must be one of IMMEDIATE or BEFORE_NEXT_EVENT. The response
 * is sent at different times depending on the ping type:
 *    * IMMEDIATE: The isolate responds as soon as it receives the control
 * message. This is after any previous control message from the same isolate
 * has been received, but may be during execution of another event.
 *    * BEFORE_NEXT_EVENT: The response is scheduled for the next time control
 * returns to the event loop of the receiving isolate, after the current event,
 * and any already scheduled control events, are completed.
 *    If response cannot be sent to the isolate, then the request is ignored.
 * It is recommended to only use simple values that can be sent to all isolates,
 * like null, booleans, numbers or strings.
 *
 * @description Check that continuously running isolate never responds
 * to ping() call with BEFORE_NEXT_EVENT priority and various response values.
 *
 * @author a.semenov@unipro.ru
 */
import "dart:isolate";
import "dart:math";
import "dart:async";
import "../../../Utils/expect.dart";
import "IsolateUtil.dart";

entryPoint(message){
  Random random = new Random();
  int s = 0;
  while (true){
    s = -s + random.nextInt(100);
  }
}

Future test(List<Object> values) async {
  ReceivePort onExit = new ReceivePort();
  Isolate isolate = await Isolate.spawn(
      entryPoint,
      null, // message
      onExit:onExit.sendPort,
      errorsAreFatal:true
  );
  // check
  List<Future> pingResponses = [];
  for (Object value in values) {
    ReceivePort pingPort = new ReceivePort();
    isolate.ping(
        pingPort.sendPort,
        response:value,
        priority:Isolate.beforeNextEvent
    );
    Future pingResponse = pingPort.first.timeout(TWO_SECONDS, onTimeout: () {
      pingPort.close();
      return "timeout";
    });
    pingResponses.add(pingResponse);
  }
  for (Object response in await Future.wait(pingResponses)){
    Expect.equals("timeout",response);
  }
  // clean up
  isolate.kill(priority:Isolate.immediate);
  await onExit.first;
  asyncEnd();
}

main() {
  asyncStart();
  test([
    null,
    0, 1, -1,
    true, false,
    "", "string",
    1.1, double.nan, double.infinity, 0.0
  ]);
}
