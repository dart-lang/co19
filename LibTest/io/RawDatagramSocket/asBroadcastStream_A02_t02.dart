/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * Stream<RawSocketEvent> asBroadcastStream({
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

Future<List<RawSocketEvent>> checkOnListen() async {
  RawDatagramSocket producer = await RawDatagramSocket.bind(localhost, 0);
  RawDatagramSocket receiver = await RawDatagramSocket.bind(localhost, 0);
  List<List<int>> toSend = [[0, 1, 2, 3], [1, 2, 3], [2, 3], [3], [4, 5], [6]];
  List<RawSocketEvent> received = [];
  Completer<List<RawSocketEvent>> completer =
      new Completer<List<RawSocketEvent>>();
  Future<List<RawSocketEvent>> f = completer.future;
  Duration delay = const Duration(seconds: 2);
  int listen = 0;
  bool anySubscribers = false;

  void onListen(StreamSubscription<RawSocketEvent> subs) {
    listen++;
  }

  var mss = receiver.asBroadcastStream(onListen: onListen);
  bool wasSent =
      await sendDatagram(producer, toSend, localhost, receiver.port);
  Expect.isTrue(wasSent, "No datagram was sent");

  Expect.equals(0, listen);

  Future<int> addSubscribers(int n) async {
    if (anySubscribers) {
      Expect.fail('anySubscribers showd be false');
    }
    Completer<int> completer = new Completer<int>();
    Future<int> f = completer.future;
    StreamSubscription ss;
    anySubscribers = true;

    ss = mss.listen((event) {
      Expect.equals(n, listen);
      receiver.receive();
      received.add(event);

      if (received.length == 1) {
        ss.cancel();
        anySubscribers = false;
        if (!completer.isCompleted) {
          receiver.close();
          completer.complete(listen);
          return f;
        }
      }

    }, onDone: () {
      anySubscribers = false;
      if (!completer.isCompleted) {
        completer.complete(listen);
        return f;
      }
    });

    new Future.delayed(delay, () {
      if (!completer.isCompleted) {
        receiver.close();
        completer.complete(listen);
        ss.cancel();
        anySubscribers = false;
      }
    });

    return f;
  }

  await addSubscribers(1);
  Expect.equals(1, listen);
  await addSubscribers(2);
  Expect.equals(2, listen);

  new Future.delayed(delay, () {
    Expect.equals(2, listen);
    if (!completer.isCompleted) {
      completer.complete(received);
    }
  });

  return f;
}

main() async {
  await checkOnListen();
}
