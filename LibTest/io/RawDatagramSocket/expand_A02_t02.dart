/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<S> expand<S>(Iterable<S> convert(T value))
 * . . .
 * If calling convert throws, or if the iteration of the returned values throws,
 * the error is emitted on the returned stream and iteration ends for that
 * element of this stream.
 *
 * @description Checks that if the iteration of the returned values throws,
 * the error is emitted on the returned stream and iteration ends for that
 * element of this stream.
 * @author ngl@unipro.ru
 */
import "dart:async";
import "dart:io";
import "../http_utils.dart";
import "../../../Utils/expect.dart";

var localhost = InternetAddress.loopbackIPv4;

Future<List<dynamic>> checkExpend(convert) async {
  RawDatagramSocket producer = await RawDatagramSocket.bind(localhost, 0);
  RawDatagramSocket receiver = await RawDatagramSocket.bind(localhost, 0);
  List<List<int>> toSend = [[0, 1, 2, 3], [1, 2, 3], [2, 3]];
  Completer<List<dynamic>> completer = new Completer<List<dynamic>>();
  Future<List<dynamic>> f = completer.future;
  Duration delay = const Duration(seconds: 2);
  List<dynamic> received = [];
  List<RawSocketEvent> receivedEvents = [];

  bool wasSent = await sendDatagram(producer, toSend, localhost, receiver.port);
  Expect.isTrue(wasSent, "No datagram was sent");

  Stream<RawSocketEvent> bcs = receiver.asBroadcastStream();
  Stream<dynamic> s = bcs.expand(convert);

  s.listen((event) {
    received.add(event);
  }, onError: (error) {
    received.add(error);
  }, onDone: () {
    if (!completer.isCompleted) {
      completer.complete(received);
    }
    return f;
  });

  bcs.listen((event) {
    receivedEvents.add(event);
    receiver.receive();
  }).onDone(() {
    if (!completer.isCompleted) {
      completer.complete(received);
    }
  });

  new Future.delayed(delay, () {
    if (!completer.isCompleted) {
      receiver.close();
    }
  });

  return f;
}

main() async {
  int attempts = 5;
  bool errorFound = false;

  toCheck(convert, int newError) async {
    for (int i = 0; i < attempts; i++) {
      List<dynamic> list = await checkExpend(convert);
      int receivedLength = list.length;

      errorFound = true;
      for (int i = 0; i < receivedLength; i++) {
        if (list[i] == newError) {
          errorFound = false;
          break;
        }
      }
      if (!errorFound) {
        break;
      }

      if (i == attempts - 1) {
        print('Error $newError not found. Look like test failed.');
      }
    }
  }

  int element(int n) {
    if (n == 5) {
      throw 15;
    }
    return n;
  }
  await toCheck((e) => e == RawSocketEvent.write
      ? [element(4), element(5), element(6)]
      : [1, 2, 3],
      15);
  await toCheck((e) => e == RawSocketEvent.read
      ? [element(4), element(5), element(6)]
      : [1, 2, 3],
      15);
  await toCheck((e) => e == RawSocketEvent.closed
      ? [element(4), element(5), element(6)]
      : [1, 2, 3],
      15);
}
