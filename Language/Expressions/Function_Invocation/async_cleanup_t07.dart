/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If f is asynchronous then, when f terminates, any open stream
 * subscriptions associated with any asynchronous for loops or yield-each
 * statements executing within f are canceled, in the order of their nesting,
 * innermost first.
 *
 * @description Check that stream subscription, associated with asynchronous
 * for loop, is cancelled, when f is terminated by throwing an exception. f is
 * asynchronous generator.
 * @author a.semenov@unipro.ru
 */
import 'dart:async';
import '../../../Utils/expect.dart';
import 'stream_utils.dart' as StreamUtils;

Stream makeStream(Iterable iterable, int id, List log) {
  return StreamUtils.makeStream(iterable, beforeCancel: () { log.add(id); });
}

Stream f(Stream stream, int skip) async* {
  await for (var s in stream) {
    skip--;
    if (skip == 0) {
      throw 'finish';
    }
    yield s;
  }
}

Future test(int skip) async {
  List log = [];
  Stream stream = makeStream(['a', 'b', 'c', 'd', 'e', 'f'], 1, log);
  f(stream, skip).listen(
      (_) { },
      onError: (e) {
        Expect.equals('finish', e);
        Expect.listEquals([1], log);
      }
  );
}

main() {
  asyncStart();
  Future.wait(
    [test(1), test(2), test(3), test(4), test(5)]
  ).then(
    (_) => asyncEnd()
  );
}
