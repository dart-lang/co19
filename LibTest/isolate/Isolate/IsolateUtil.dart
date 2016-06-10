/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 *
 * @author a.semenov@unipro.ru
 */
import "dart:async";
import "dart:isolate";

Duration ONE_SECOND = new Duration(seconds:1);
Duration TWO_SECONDS = new Duration(seconds:2);
Duration THREE_SECONDS = new Duration(seconds:3);

/**
 * send ping with given payload to given isolate. Returns the response,
 * received from the isolate, which should be equal to payload. If timeout is
 * specified and response is not received during the timeout interval, then
 * value "timeout" is returned.
 */
Future ping(Isolate isolate, payload, [Duration timeout]) async {
  ReceivePort pingPort = new ReceivePort();
  isolate.ping(pingPort.sendPort, response:payload);
  Future result = pingPort.first;
  if (timeout!=null){
    result = result.timeout(timeout, onTimeout: () {
      pingPort.close();
      return "timeout";
    });
  }
  return result;
}
