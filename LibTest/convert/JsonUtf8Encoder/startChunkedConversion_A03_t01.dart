/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion ChunkedConversionSink<Object> startChunkedConversion(
 *  Sink<List<int>> sink
 *  )
 * Start a chunked conversion.
 * ...
 * The argument sink will receive byte lists in sizes depending on the
 * bufferSize passed to the constructor when creating this encoder.
 * @description Checks that the argument sink will receive byte lists in sizes
 * depending on the bufferSize passed to the constructor when creating this
 * encoder.
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";

check(JsonUtf8Encoder encoder, data, List expected) {
  bool called = false;
  Sink<List<int>> outSink = new ChunkedConversionSink.withCallback((List chunks) {
    Expect.equals(expected.length, chunks.length);
    for (var i = 0; i < expected.length; i++) {
      Expect.listEquals(utf8.encode(expected[i]), chunks[i]);
    }
    called = true;
  });
  var inSink = encoder.startChunkedConversion(outSink);
  inSink.add(data);
  inSink.close();
  Expect.isTrue(called);
}

String chunks2string(Iterable<String> data) {
  StringBuffer sb = new StringBuffer();
  Iterator it = data.iterator;
  while (it.moveNext()) {
    sb.write(it.current);
  }
  return sb.toString();
}

main() {
  check(new JsonUtf8Encoder(null, null, 4), '12345678901234567890',
      ['"123', '4567', '8901', '2345', '6789', '0"']);
  check(new JsonUtf8Encoder(null, null, 4), '[1, 2, 3, 4, 5]',
      ['"[1,', ' 2, ', '3, 4', ', 5]', '"']);
}
