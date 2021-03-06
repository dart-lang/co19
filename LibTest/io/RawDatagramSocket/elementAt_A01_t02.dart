// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Future<RawSocketEvent> elementAt(int index)
/// Returns the value of the indexth data event of this stream.
///
/// Stops listening to the stream after the indexth data event has been received.
///
/// Internally the method cancels its subscription after these elements. This
/// means that single-subscription (non-broadcast) streams are closed and cannot
/// be reused after a call to this method.
///
/// If an error event occurs before the value is found, the future completes with
/// this error.
///
/// @description Checks that if receiver RawDatagramSocket is closed after
/// method 'elementAt' call, the correct value of 0, 1, and 2 indexes are returned.
/// @author ngl@unipro.ru

import "dart:async";
import "dart:io";
import "../http_utils.dart";
import "../../../Utils/expect.dart";

var localhost = InternetAddress.loopbackIPv4;

Future<dynamic> checkElementAt(int index) async {
  RawDatagramSocket producer = await RawDatagramSocket.bind(localhost, 0);
  RawDatagramSocket receiver = await RawDatagramSocket.bind(localhost, 0);
  List<List<int>> toSend = [[0, 1, 2, 3], [1, 2, 3], [2, 3]];
  List<RawSocketEvent> received = [];
  Completer<dynamic> completer = new Completer<dynamic>();
  Future<dynamic> f = completer.future;
  Duration delay = const Duration(seconds: 2);

  bool wasSent = await sendDatagram(producer, toSend, localhost, receiver.port);
  Expect.isTrue(wasSent, "No datagram was sent");

  Stream bcs = receiver.asBroadcastStream();
  Future fValue = bcs.elementAt(index);

  fValue.then((value) {
    receiver.close();
    if (!completer.isCompleted) {
      completer.complete(value);
    }
    return f;
  }).catchError((e) {
    if (!completer.isCompleted) {
      completer.complete(e);
    }
  });

  bcs.listen((event) {
    received.add(event);
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

  check(int index) async {
    for (int i = 0; i < attempts; i++) {
      dynamic value = await checkElementAt(index);
      if (value is RawSocketEvent) {
        break;
      }
      if (value is RangeError && (i < attempts - 1)) {
        continue;
      }
      if (i == attempts - 1) {
        print('Index $index element not found.');
      }
    }
  }

  await check(0);
  await check(1);
  await check(2);
  await check(3);
}
