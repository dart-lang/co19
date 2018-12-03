/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future flush()
 * This method must not be called while an [addStream] is incomplete.
 * @description Checks that [flush] causes error if [addStream] is currently
 * incomplete.
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:async";
import "dart:io";

test(Stdout sink) async {
  Stream<List> stream = new Stream<List<int>>.fromIterable([[1, 2]]);
  sink.addStream(stream).then((x) {
    new Future.delayed(new Duration(seconds: 3));
  });
  Expect.throws(() { sink.flush(); }, (e) => e is StateError);
}

main(List<String> args) {
  test(stdout);
  test(stderr);
}
