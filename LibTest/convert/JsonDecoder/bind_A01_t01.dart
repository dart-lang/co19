/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream bind(Stream stream)
 * Transform the incoming stream's events.
 * Creates a new stream. When this stream is listened to, it will start
 * listening on stream, and generate events on the new stream based on the
 * events from stream.
 *
 * Subscriptions on the returned stream should propagate pause state to the
 * subscription on stream.
 * @description Checks that this method transforms stream's events
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "dart:async";
import "../../../Utils/expect.dart";
import "../../../Utils/async_utils.dart";
import "table1.lib.dart" show table;

check(Iterable<String> data) {
  Stream stream1 = new Stream.fromIterable(data);

  JsonDecoder decoder = new JsonDecoder();
  Stream stream2 = decoder.bind(stream1);

  asyncStart();

  stream2.listen((Object event) {
    Expect.deepEquals(decoder.convert(data2string(data)), event);
  }, onError: (error) {
    Expect.fail("onError($error) called unexpectedly");
  }, onDone: () {
    asyncEnd();
  });
}

String data2string(Iterable<String> data) {
  StringBuffer sb = new StringBuffer();
  Iterator it = data.iterator;
  while (it.moveNext()) {
    sb.write(it.current);
  }
  return sb.toString();
}

main() {
  check(["1", "2", "3.14"]);
  check(["[[1, 2, 3],", '{"a": "3"}]']);
  check(['{"a"', ':', '"b"', '}']);
}
