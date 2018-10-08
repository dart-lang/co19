/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String convert(
 *  List<int> bytes, [
 *  int start = 0,
 *  int end
 *  ])
 * Transform the incoming stream's events.
 *
 * Creates a new stream. When this stream is listened to, it will start
 * listening on stream, and generate events on the new stream based on the
 * events from stream.
 *
 * Subscriptions on the returned stream should propagate pause state to the
 * subscription on stream.
 * @description Checks that this method decodes data to Latin1 string
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";

main() {
  Latin1Decoder decoder = new Latin1Decoder();
  for (int i = 0; i < 256; i++) {
    String s = new String.fromCharCode(i);
    Expect.equals(s, decoder.convert([i]));
  }
  for (int i = 256; i < 65536; i++) {
    Expect.throws(() {decoder.convert([i]);});
  }
}
