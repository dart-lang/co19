/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void add(List<int> data)
 * This function must not be called when a stream is currently being added using
 * [addStream].
 * @description Checks that calling the [add] function after [addStream] does
 * not cause error if stream adding is finished before the [add] method call.
 * @author iarkh@unipro.ru
 */
import "dart:async";
import "dart:io";

test(Stdout sink) async{
  Stream<List> aStream = new Stream<List<int>>.fromIterable([[1, 2, 3, 4, 5]]);

  await sink.addStream(aStream).then((x) {
    new Future.delayed(new Duration(seconds: 3));
  });

  sink.add([71, 72, 73, 74, 75]);
}

main() {
  test(stdout);
  test(stderr);
}
