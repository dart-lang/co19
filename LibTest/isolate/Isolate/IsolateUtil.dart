/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 *
 * @author a.semenov@unipro.ru
 */
import "dart:async";
import "dart:isolate";

Duration ONE_SECOND = new Duration(seconds: 1);
Duration TWO_SECONDS = new Duration(seconds: 2);
Duration THREE_SECONDS = new Duration(seconds: 3);

/**
 * send ping with given payload to given isolate. Returns the response,
 * received from the isolate, which should be equal to payload. If timeout is
 * specified and response is not received during the timeout interval, then
 * value "timeout" is returned.
 */
Future ping(Isolate isolate, payload, [Duration timeout]) {
  ReceivePort pingPort = new ReceivePort();
  Future result = pingPort.first;
  isolate.ping(pingPort.sendPort, response: payload);
  if (timeout != null) {
    result = result.timeout(timeout, onTimeout: () {
      pingPort.close();
      return "timeout";
    });
  }
  return result;
}

/**
 * Basement for Echo and Error servers
 */
abstract class Server {
  static const String _STOP = "!stop";

  Isolate isolate;
  SendPort sendPort;

  Server(Isolate isolate, SendPort sendPort) {
    this.isolate = isolate;
    this.sendPort = sendPort;
  }

  void requestStop() {
    sendPort.send(_STOP);
  }

  Future stop() {
    ReceivePort exitPort = new ReceivePort();
    isolate.addOnExitListener(exitPort.sendPort);
    Future result = exitPort.first; // subscribe first
    requestStop();
    return result;
  }

  Future kill({int priority: Isolate.beforeNextEvent}) {
    ReceivePort exitPort = new ReceivePort();
    isolate.addOnExitListener(exitPort.sendPort);
    Future result = exitPort.first; // subscribe first
    isolate.kill(priority: priority);
    return result;
  }

  void send(message) {
    sendPort.send(message);
  }
}

/**
 * Utility class, that helps to spawn isolates, which sole purpose is
 * to generate errors.
 */
class ErrorServer extends Server {
  ErrorServer(Isolate isolate, SendPort sendPort) : super(isolate, sendPort);

  static Future<ErrorServer> spawn(
      {bool errorsAreFatal, SendPort onExit, SendPort onError}) async {
    ReceivePort receivePort = new ReceivePort();
    Isolate isolate = await Isolate.spawn(
        isolateEntryPoint, receivePort.sendPort,
        errorsAreFatal: errorsAreFatal, onExit: onExit, onError: onError);
    SendPort sendPort = await receivePort.first;
    return new ErrorServer(isolate, sendPort);
  }

  static void isolateEntryPoint(SendPort sendPort) {
    ReceivePort receivePort = new ReceivePort();
    int i = 0;
    StreamSubscription ss;
    ss = receivePort.listen((x) {
      if (x == Server._STOP) {
        ss.cancel();
        receivePort.close();
      } else {
        throw i++;
      }
    });
    sendPort.send(receivePort.sendPort);
  }

  void generateError() {
    sendPort.send("error");
  }
}

/**
 * Utility class, that helps to spawn isolates, which sole purpose is
 * to send back the received data
 */
class EchoServer extends Server {
  EchoServer(Isolate isolate, SendPort sendPort) : super(isolate, sendPort);

  static Future<EchoServer> spawn(SendPort dataSendPort,
      {bool errorsAreFatal, SendPort onExit, SendPort onError}) async {
    ReceivePort receivePort = new ReceivePort();
    Isolate isolate = await Isolate.spawn(
        isolateEntryPoint, [receivePort.sendPort, dataSendPort],
        errorsAreFatal: errorsAreFatal, onExit: onExit, onError: onError);
    SendPort sendPort = await receivePort.first;
    return new EchoServer(isolate, sendPort);
  }

  static void isolateEntryPoint(List<SendPort> sendPort) {
    ReceivePort receivePort = new ReceivePort();
    StreamSubscription ss;
    ss = receivePort.listen((dynamic x) {
      if (x == Server._STOP) {
        ss.cancel();
        receivePort.close();
      } else if ((x is List) && (x.length == 2) && (x[0] is SendPort)) {
        x[0].send(x[1]);
      } else {
        sendPort[1].send(x);
      }
    });
    sendPort[0].send(receivePort.sendPort);
  }

  Future<Object> ping(Object message,
      [Duration timeout, Object timeoutResponse]) {
    ReceivePort receivePort = new ReceivePort();
    Future<Object> result = receivePort.first;
    sendPort.send([receivePort.sendPort, message]);
    if (timeout != null) {
      result = result.timeout(timeout, onTimeout: () {
        receivePort.close();
        return timeoutResponse;
      });
    }
    return result;
  }
}
