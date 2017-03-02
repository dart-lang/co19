/*
 * Copyright (c) 2011-2017, the Dart project authors.  Please see the AUTHORS
 * file for details. All rights reserved. Use of this source code is governed
 * by a BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Sends messages to its ReceivePorts.
 *    SendPorts are created from ReceivePorts. Any message sent through
 * a SendPort is delivered to its corresponding ReceivePort. There might
 * be many SendPorts for the same ReceivePort.
 *    SendPorts can be transmitted to other isolates, and they preserve
 * equality when sent.
 *
 * @description Checks hashCode and equality operator for SendPort, pointing to
 * open ReceivePort
 *
 * @author a.semenov@unipro.ru
 */
import "dart:isolate";
import "../../core/Object/allTests.lib.dart" as object;

List<ReceivePort> closeOnExit = [];

Object create() {
  ReceivePort receivePort = new ReceivePort();
  closeOnExit.add(receivePort);
  return receivePort.sendPort;
}

List<Object> createEqual(int number) {
  ReceivePort receivePort = new ReceivePort();
  closeOnExit.add(receivePort);
  return new List.filled(number, receivePort.sendPort, growable:false);
}

List<Object> createNotEqual(int number) {
  List<Object> result = [];
  for (int i=0; i<number; i++) {
    ReceivePort receivePort = new ReceivePort();
    closeOnExit.add(receivePort);
    result.add(receivePort.sendPort);
  }
  return result;
}

main() {
  object.test(create, createEqual, createNotEqual);
  // clean up
  closeOnExit.forEach((receivePort) => receivePort.close());
}
