/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * Stream<RawSocketEventT> asBroadcastStream({
 *     void onListen(StreamSubscription<T> subscription),
 *     void onCancel(StreamSubscription<T> subscription)
 * })
 * Returns a multi-subscription stream that produces the same events as this.
 * . . .
 * If onListen is provided, it is called with a subscription-like object that
 * represents the underlying subscription to this stream. It is possible to
 * pause, resume or cancel the subscription during the call to onListen.
 * It is not possible to change the event handlers, including using
 * StreamSubscription.asFuture.
 *
 * @description Checks that if onListen is provided, it is called with a
 * subscription-like object that represents the underlying subscription to this
 * stream.
 * @author ngl@unipro.ru
 */
import "dart:async";
import "dart:io";
import "../http_utils.dart";
import "../../../Utils/expect.dart";

var localhost = InternetAddress.loopbackIPv4;

Future<List<RawSocketEvent>> check() async {
  RawDatagramSocket producer = await RawDatagramSocket.bind(localhost, 0);
  RawDatagramSocket receiver = await RawDatagramSocket.bind(localhost, 0);
  List<List<int>> toSend = [[0, 1, 2, 3], [1, 2, 3], [2, 3], [3], [4, 5], [6]];
  List<RawSocketEvent> received = [];
  List<RawSocketEvent> received1 = [];
  Completer<List<RawSocketEvent>> completer =
      new Completer<List<RawSocketEvent>>();
  Future<List<RawSocketEvent>> f = completer.future;
  Duration delay = const Duration(seconds: 2);
  int listen = 0;

  void onListen(StreamSubscription<RawSocketEvent> subs) {
    listen++;
  }

  var mss = receiver.asBroadcastStream(onListen: onListen);

  bool wasSent =
      await sendDatagram(producer, toSend, localhost, receiver.port);
  Expect.isTrue(wasSent, "No datagram was sent");

  Expect.equals(0, listen);
  StreamSubscription ss1;
  StreamSubscription ss2;
  ss1 = mss.listen((event) {
    Expect.equals(1, listen);
    received1.add(event);
    receiver.receive();
    if (received1.length == 2) {
      ss1.cancel();
      ss2 = mss.listen((event) {
        Expect.equals(2, listen);
        received.add(event);
        receiver.receive();
      }, onDone: () {
        if (!completer.isCompleted) {
          completer.complete(received);
        }
        ss2.cancel();
      });
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
  List<RawSocketEvent> expectedValues =
      [RawSocketEvent.read, RawSocketEvent.closed];

  checkReceived(check, expectedValues, 5);
}
