/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<S> expand<S>(Iterable<S> convert(T value))
 * Transforms each element of this stream into a sequence of elements.
 *
 * Returns a new stream where each element of this stream is replaced by zero or
 * more data events. The event values are provided as an Iterable by a call to
 * convert with the element as argument, and the elements of that iterable is
 * emitted in iteration order.
 *
 * @description Checks that method [expand] returns a new stream where each
 * element of this stream is replaced by zero or more data events.
 * @author ngl@unipro.ru
 */

import "dart:async";
import "dart:io";
import "../http_utils.dart";
import "../../../Utils/expect.dart";

var localhost = InternetAddress.loopbackIPv4;

Future<List> checkExpand(convert) async {
  RawDatagramSocket producer = await RawDatagramSocket.bind(localhost, 0);
  RawDatagramSocket receiver = await RawDatagramSocket.bind(localhost, 0);
  List<List<int>> toSend = [[0, 1, 2, 3], [1, 2, 3], [2, 3]];
  Completer<List> completer = new Completer<List>();
  Future<List> f = completer.future;
  Duration delay = const Duration(seconds: 2);
  List received = [];
  List receivedEvents = [];

  bool wasSent = await sendDatagram(producer, toSend, localhost, receiver.port);
  Expect.isTrue(wasSent, "No datagram was sent");

  Stream<RawSocketEvent> bcs = receiver.asBroadcastStream();
  Stream s = bcs.expand(convert);
  Future list = s.toList();

  list.then((value) {
    received = value;
  }).whenComplete(() {
    if (!completer.isCompleted) {
      completer.complete(received);
    }
    return f;
  });

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

  toCheck(convert, List expected, int newReplaced) async {
    for (int i = 0; i < attempts; i++) {
      List list = await checkExpand(convert);
      int recLength = list.length;

      if (recLength == newReplaced && recLength == 0) {
        break;
      }
      bool notFound = false;
      if (recLength > 0 || recLength >= newReplaced) {
        if (newReplaced == 1) {
          for (int i = 0; i < list.length; i++) {
            if (list[i] != expected[0] && list[i] != expected[1] &&
                list[i] != expected[2]) {
              notFound = true;
              break;
            }
          }
          if (!notFound) {
            break;
          }
        }
        if (newReplaced == 2) {
          for (int i = 0; i < list.length; i++) {
            if (list[i] != expected[0] && list[i] != expected[1] &&
                list[i] != expected[2]) {
              notFound = true;
              break;
            }
            if (i + 1 >= recLength) {
              notFound = true;
              break;
            }
            if (list[i + 1] != list[i]) {
              notFound = true;
              break;
            }
            i++;
          }
          if (!notFound) {
            break;
          }
        }
        if (newReplaced == 3) {
          for (int i = 0; i < list.length; i += 3) {
            if (i + 1 >= recLength && i + 2 >= recLength) {
              notFound = true;
              break;
            }
            if (list[i] != expected[0] || list[i + 1] != expected[1] ||
                list[i + 2] != expected[2]) {
              notFound = true;
              break;
            }
          }
          if (!notFound) {
            break;
          }
        }
      }

      if (i == attempts - 1) {
        print('$recLength elements not found. Look like test failed.');
      }
    }
  }

  await toCheck((e) => [], [], 0);
  await toCheck((e) => [e],
      [RawSocketEvent.write, RawSocketEvent.read, RawSocketEvent.closed], 1);
  await toCheck((e) => [e, e],
      [RawSocketEvent.write, RawSocketEvent.read, RawSocketEvent.closed], 2);
  await toCheck((e) => [1, 2, 3], [1, 2, 3], 3);
}
