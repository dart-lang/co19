/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<String> bind(Stream<Object> stream)
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

check(Object data) {
  Stream stream1 = new Stream.fromIterable([data]);

  JsonEncoder encoder = new JsonEncoder();
  Stream stream2 = encoder.bind(stream1);
  StringBuffer sb = new StringBuffer();

  asyncStart();

  stream2.listen((Object event) {
    sb.write(event);
  }, onError: (error) {
    Expect.fail("onError($error) called unexpectedly");
  }, onDone: () {
    Expect.equals(encoder.convert(data), sb.toString());
    asyncEnd();
  });
}

main() {
  check(1);
  check(3.14);
  check(null);
  check(true);
  check(false);
  check('"str"');
  check(["1", "2", "3.14"]);
  check([[1, 2, 3], {"a": "3"}]);
  check({"a": "b"});
  check({"й": " ф "});
}
