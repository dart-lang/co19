/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future close()
 * Close the target consumer.
 * @description Checks that target consumer gets closed after the [IOSink.close]
 * and it's impossible to write there after this.
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:io";

test(Stdout sink) async {
  int closed = 0;
  await sink.close().then((x) { closed++; });
  Expect.equals(1, closed);
  Expect.throws(() { sink.writeln(); }, (e) => e is Error);
}

main(List<String> args) {
  test(stdout);
  test(stderr);
}
