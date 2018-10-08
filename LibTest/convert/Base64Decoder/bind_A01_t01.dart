/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<T> bind(Stream<S> stream)
 * Transform the incoming stream's events.
 *
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

Future check(String str) async {
  Base64Decoder decoder = new Base64Decoder();
  String encoded = base64.encode(str.codeUnits);

  await for (List<int> event in decoder.bind(new Stream.fromIterable([encoded]))) {
    Expect.listEquals(str.codeUnits, event);
  }
}

main() {
  asyncStart();
  Future.wait([
    check("Some string"),
    check("abcdefghijklmnopqrstuvwxyz"),
    check("123456789"),
    check("")
  ]).then(
      (_) => asyncEnd()
  );
}
