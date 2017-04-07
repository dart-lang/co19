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
 * @description Checks that If start and end are provided, only the sub-list of
 * bytes from start to end (end not inclusive) is used as input to the
 * conversion.
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";

main() {
  Latin1Decoder decoder = new Latin1Decoder();
  String toEncode = "12345";
  List<int> toDecode = new List.from(toEncode.codeUnits);

  Expect.equals(toEncode, decoder.convert(toDecode));
  Expect.equals("2345", decoder.convert(toDecode, 1));
  Expect.equals("234", decoder.convert(toDecode, 1, 4));
}
