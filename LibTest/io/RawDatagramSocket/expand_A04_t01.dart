/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<S> expand<S>(Iterable<S> convert(T value))
 * Creates a new stream from this stream that converts each element into zero
 * or more events.
 * . . .
 * If a broadcast stream is listened to more than once, each subscription will
 * individually call convert and expand the events.
 *
 * @description Checks that if a broadcast stream is listened to more than once,
 * each subscription will individually call convert and expand the events.
 * @author ngl@unipro.ru
 */
import "dart:async";
import "dart:io";
import "../http_utils.dart";
import "../../../Utils/expect.dart";

var localhost = InternetAddress.loopbackIPv4;

Future<List> checkExpend(bool secondListen) async {
  RawDatagramSocket producer = await RawDatagramSocket.bind(localhost, 0);
  RawDatagramSocket receiver = await RawDatagramSocket.bind(localhost, 0);
  List<List<int>> toSend = [[0, 1, 2, 3], [1, 2, 3], [2, 3]];
  Completer<List> completer = new Completer<List>();
  Future<List> f = completer.future;
  Duration delay = const Duration(seconds: 2);
  List<dynamic> received = [];
  List<dynamic> receivedEvents = [];
  int n = 0;

  bool wasSent = await sendDatagram(producer, toSend, localhost, receiver.port);
  Expect.isTrue(wasSent, "No datagram was sent");

  Iterable convert(value) {
    n++;
    return [1];
  }

  Stream<RawSocketEvent> bcs = receiver.asBroadcastStream();
  Stream s = bcs.expand(convert);
  Future list1 = s.toList();

  list1.then((value) {
    received = value;
  }).whenComplete(() {
    if (!secondListen) {
      if (!completer.isCompleted) {
        completer.complete(received);
      }
      return f;
    }
  });

  if (secondListen) {
    Future list2 = s.toList();
    list2.then((value) {
      for (int i = 0; i < value.length; i++) {
        received.add(value[i]);
      }
    }).whenComplete(() {
      if (!completer.isCompleted) {
        completer.complete(received);
      }
      return f;
    });
  }

  bcs.listen((event) {
    receivedEvents.add(event);
    receiver.receive();
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

  toCheck(bool secondListen, int num) async {
    for (int i = 0; i < attempts; i++) {
      List receivedList = await checkExpend(secondListen);
      int receivedLength = receivedList.length;

      if (receivedLength <= num && num == 4) {
        break;
      } else {
        if (receivedLength <= num && (receivedLength & 1) == 0) {
          break;
        }
      }
      if (i == attempts - 1) {
        print('$receivedLength elements found. Look like test failed.');
      }
    }
  }

  await toCheck(false, 4);
  await toCheck(true, 8);
}
