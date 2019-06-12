/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion List<int> data
 * @description Checks that this property changes data
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  InternetAddress address = new InternetAddress("127.0.0.1");
  Datagram datagram = new Datagram(new Uint8List(0), address, 80);
  Expect.listEquals([], datagram.data);

  datagram.data = Uint8List.fromList([1, 2, 3]);
  Expect.listEquals([1, 2, 3], datagram.data);

  datagram.data = Uint8List.fromList([255, 127, 33]);
  Expect.listEquals([255, 127, 33], datagram.data);
}
