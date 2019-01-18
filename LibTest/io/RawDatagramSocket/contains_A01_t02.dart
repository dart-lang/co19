/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<bool> contains(Object needle)
 * Returns whether needle occurs in the elements provided by this stream.
 *
 * Compares each element of this stream to needle using Object.==. If an equal
 * element is found, the returned future is completed with true. If the stream
 * ends without finding a match, the future is completed with false.
 *
 * @description Checks whether needle occurs in the elements provided by this
 * RawDatagramSocket.
 * @author ngl@unipro.ru
 */

import "dart:async";
import "dart:io";
import "../http_utils.dart";
import "../../../Utils/expect.dart";

var localhost = InternetAddress.loopbackIPv4;

Future<bool> checkContains(value) async {
  RawDatagramSocket producer = await RawDatagramSocket.bind(localhost, 0);
  RawDatagramSocket receiver = await RawDatagramSocket.bind(localhost, 0);
  List<List<int>> toSend = [[0, 1, 2, 3], [1, 2, 3], [2, 3], [3]];
  Completer<bool> completer = new Completer<bool>();
  Future<bool> f = completer.future;
  Duration delay = const Duration(seconds: 2);

  bool wasSent = await sendDatagram(producer, toSend, localhost, receiver.port);
  Expect.isTrue(wasSent, "No datagram was sent");


  Stream<RawSocketEvent> stream = receiver.asBroadcastStream();
  Future<bool> b = stream.contains(value);

  stream.listen((event) {
    receiver.receive();
  });

  new Future.delayed(const Duration(seconds: 1), () {
    receiver.close();
  });

  new Future.delayed(delay, () {
    if (!completer.isCompleted) {
      completer.complete(b);
    }
  });
  return f;
}

main() async {
  int attempts = 5;

  toCheck(value, bool expected) async {
    for (int i = 0; i < attempts; i++) {
      bool result = await checkContains(value);
      if (result == expected) {
        break;
      }
      if (i == attempts - 1) {
        print('$value element was not found. Look like test failed.');
      }
    }
  }

  await toCheck(RawSocketEvent.write, true);
  await toCheck(RawSocketEvent.read, true);
  await toCheck(RawSocketEvent.closed, true);
  await toCheck(RawSocketEvent.readClosed, false);

}
