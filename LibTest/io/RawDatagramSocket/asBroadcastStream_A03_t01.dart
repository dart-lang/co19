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
 * If onCancel is provided, it is called in a similar way to onListen when the
 * returned stream stops having listener. If it later gets a new listener, the
 * onListen function is called again.
 *
 * @description Checks that if onCancel is provided, it is called in a similar
 * way to onListen when the returned stream stops having listener.
 * @author ngl@unipro.ru
 */
import "dart:async";
import "dart:io";
import "../http_utils.dart";
import "../../../Utils/expect.dart";

var localhost = InternetAddress.loopbackIPv4;

Future<List<RawSocketEvent>> checkOnCancel() async {
  RawDatagramSocket producer = await RawDatagramSocket.bind(localhost, 0);
  RawDatagramSocket receiver = await RawDatagramSocket.bind(localhost, 0);
  List<List<int>> toSend = [[0, 1, 2, 3], [1, 2, 3], [2, 3], [3], [4, 5], [6]];
  List<RawSocketEvent> received = [];
  Completer<List<RawSocketEvent>> completer =
      new Completer<List<RawSocketEvent>>();
  Future<List<RawSocketEvent>> f = completer.future;
  Duration delay = const Duration(seconds: 2);
  int cancel = 0;
  bool anySubscribers = false;

  void onCancel(StreamSubscription<RawSocketEvent> subs) {
    cancel++;
  }

  var mss = receiver.asBroadcastStream(onCancel: onCancel);
  bool wasSent =
      await sendDatagram(producer, toSend, localhost, receiver.port);
  Expect.isTrue(wasSent, "No datagram was sent");

  Expect.equals(0, cancel);

  Future<int> addSubscribers(int n) async {
    if (anySubscribers) {
      Expect.fail('anySubscribers showd be false');
    }
    Completer<int> completer = new Completer<int>();
    Future<int> f = completer.future;
    StreamSubscription ss;
    anySubscribers = true;

    ss = mss.listen((event) {
      Expect.equals(n - 1, cancel);
      received.add(event);
      receiver.receive();

      if (received.length == 1) {
        ss.cancel();
        anySubscribers = false;
        if (!completer.isCompleted) {
          receiver.close();
          completer.complete(cancel);
          return f;
        }
      }
    }, onDone: () {
      anySubscribers = false;
      if (!completer.isCompleted) {
        completer.complete(cancel);
        return f;
      }
    });

    new Future.delayed(delay, () {
      if (!completer.isCompleted) {
        receiver.close();
        completer.complete(cancel);
        ss.cancel();
        anySubscribers = false;
      }
    });

    return f;
  }

  await addSubscribers(1);
  Expect.equals(1, cancel);
  await addSubscribers(2);
  Expect.equals(2, cancel);

  new Future.delayed(delay, () {
    if (!completer.isCompleted) {
      Expect.equals(2, cancel);
      completer.complete(received);
    }
  });

  return f;
}

main() async {
  await checkOnCancel();
}
