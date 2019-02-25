/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<E> drain<E>([E futureValue ])
 * Discards all data on the stream, but signals when it's done or an error
 * occurred.
 *
 * When subscribing using drain, cancelOnError will be true. This means that the
 * future will complete with the first error on the stream and then cancel the
 * subscription.
 *
 * In case of a done event the future completes with the given futureValue.
 *
 * @description Checks that future is completed with futureValue when it is
 * specified, and received stream is closed before [drain].
 * @author ngl@unipro.ru
 */
import "dart:async";
import "dart:io";
import "../http_utils.dart";
import "../../../Utils/expect.dart";

var localhost = InternetAddress.loopbackIPv4;

Future<dynamic> checkDrain([value]) async {
  RawDatagramSocket producer = await RawDatagramSocket.bind(localhost, 0);
  RawDatagramSocket receiver = await RawDatagramSocket.bind(localhost, 0);
  List<List<int>> toSend = [[0, 1, 2, 3], [1, 2, 3], [2, 3], [3], [4, 5], [5]];
  List<RawSocketEvent> received = [];
  Completer<dynamic> completer = new Completer<dynamic>();
  Future<dynamic> f = completer.future;

  bool wasSent = await sendDatagram(producer, toSend, localhost, receiver.port);
  Expect.isTrue(wasSent, "No datagram was sent");
  receiver.close();

  Future v = receiver.drain(value);
  v.then((drainValue) {
    if (!completer.isCompleted) {
      completer.complete(drainValue);
    }
    return f;
  });

  return f;
}

main() async {
  int attempts = 5;

  toCheck(var value) async {
    for (int i = 0; i < attempts; i++) {
      var received_value = await checkDrain(value);
      if (received_value == value) {
        break;
      }
      if (i == attempts - 1) {
        print('$received_value of drain not found. Look like test failed.');
      }
    }
  }

  await toCheck(null);
  await toCheck(18);
  await toCheck('abc');
  await toCheck(RawSocketEvent.write);
  await toCheck(RawSocketEvent.read);
  await toCheck(RawSocketEvent.closed);
  await toCheck(RawSocketEvent.readClosed);
}
