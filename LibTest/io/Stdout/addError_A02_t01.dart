/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void addError(error, [StackTrace stackTrace])
 * This function must not be called when a stream is currently being added using
 * [addStream].
 * @description Checks that adding [error] when another stream is being added
 * causes [StateError].
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:async";
import "dart:io";

test(Stdout sink) {
  Stream<List> aStream = new Stream<List<int>>.fromIterable([[1, 2, 3, 4, 5]]);

  sink.addStream(aStream).then((x) {
    new Future.delayed(new Duration(seconds: 3));
  });

  Expect.throws(() { sink.addError("Error"); }, (e) => e is StateError);
}

main() {
  test(stdout);
  test(stderr);
}
