/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future addStream(Stream<List<int>> stream)
 * Returns a [Future] that completes when all elements of the given stream are
 * added to [this].
 * @description Checks that [Future] is returned and completed after [stream] is
 * added to [stdout] or [stderr].
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:async";
import "dart:io";

test(Stdout sink) async {
  int called = 0;
  await sink.addStream(new Stream<List<int>>.fromIterable([[73, 45]])).then((_) {
    called++;
  });
  Expect.equals(1, called);
}

main(List<String> args) {
  test(stdout);
  test(stderr);
}
