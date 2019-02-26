/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<RawSocketEvent> elementAt(int index)
 * Returns the value of the indexth data event of this stream.
 *
 * Stops listening to the stream after the indexth data event has been received.
 *
 * Internally the method cancels its subscription after these elements. This
 * means that single-subscription (non-broadcast) streams are closed and cannot
 * be reused after a call to this method.
 *
 * If an error event occurs before the value is found, the future completes with
 * this error.
 *
 * @description Checks that if receiver RawDatagramSocket is closed before
 * method 'elementAt' calling, this stream contains only one element
 * RawSocketEvent.closed.
 * @author ngl@unipro.ru
 */
import "dart:async";
import "dart:io";
import "../http_utils.dart";
import "../../../Utils/expect.dart";

var localhost = InternetAddress.loopbackIPv4;

Future<RawSocketEvent> checkElementAt(int index) async {
  RawDatagramSocket producer = await RawDatagramSocket.bind(localhost, 0);
  RawDatagramSocket receiver = await RawDatagramSocket.bind(localhost, 0);
  List<List<int>> toSend = [[0, 1, 2, 3], [1, 2, 3]];
  Completer<RawSocketEvent> completer = new Completer<RawSocketEvent>();
  Future<RawSocketEvent> f = completer.future;

  bool wasSent = await sendDatagram(producer, toSend, localhost, receiver.port);
  Expect.isTrue(wasSent, "No datagram was sent");
  receiver.close();

  Future fValue = receiver.elementAt(index);
  fValue.then((value) {
    if (!completer.isCompleted) {
      completer.complete(value);
    }
    return f;
  });

  return f;
}

main() async {
  int attempts = 5;

  for (int i = 0; i < attempts; i++) {
    RawSocketEvent value = await checkElementAt(0);
    if (value == RawSocketEvent.closed) {
      break;
    }

    if (i == attempts - 1) {
      print('$value element not found. Look like test failed.');
    }
  }
}
