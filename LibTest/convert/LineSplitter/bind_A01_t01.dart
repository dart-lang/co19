/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream bind(Stream<String> stream)
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
  LineSplitter ls = new LineSplitter();
  List<String> expected = ls.convert(str);
  int counter = 0;

  await for (String event in ls.bind(new Stream.fromIterable([str]))) {
    Expect.equals(expected[counter++], event);
  }
}

main() {
  asyncStart();
  Future.wait([
    check(""),
    check("aaa\nbbb\rccc\r\nddd"),
    check('aaa\nbbb\rccc\r\nddd'),
    check('''aaa
    bbb
    ccc
    ddd'''),
    check("""aaa
    bbb
    ccc
    ddd"""),
    check("aaa"
    'bb'
    "cc"
    'dd')
  ]).then(
      (_) => asyncEnd()
  );
}
