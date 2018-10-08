/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
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
import "dart:async";
import "dart:convert";
import "../../../Utils/expect.dart";

Future check(List<String> data) async {
  JsonDecoder decoder = new JsonDecoder();
  await for (Object event in decoder.bind(new Stream.fromIterable(data))) {
    Expect.deepEquals(decoder.convert(data2string(data)), event);
  }
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
  asyncStart();
  Future.wait([
    check(["1", "2", "3.14"]),
    check(["[[1, 2, 3],", '{"a": 3}]']),
    check(['{"a"', ':', '"b"', '}']),
    check(['[{"a"', ':', '"b"', '}, ', '{"c": 5', '}]']),
    check(["true"]),
    check(["false"]),
    check(["null"]),
    check(['{"й"', ':', '"ф"', '}'])
  ]).then(
      (_) => asyncEnd()
  );
}
