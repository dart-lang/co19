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
 * @description Check that stream subscriptions, associated with
 * asynchronous for loops, are cancelled in innermost first order, when f is
 * terminated by return. f is asynchronous generator.
 * @author a.semenov@unipro.ru
 */
import 'dart:async';
import '../../../Utils/expect.dart';
import 'stream_utils.dart' as StreamUtils;

Stream makeStream(Iterable iterable, int id, List log) {
  return StreamUtils.makeStream(iterable, beforeCancel: () { log.add(id); });
}

Stream f(List log, int skip) async* {
  int i = 0;
  await for (var s in makeStream(['a', 'b', 'c', 'd'], i++, log)) {
    await for (var s in makeStream(['a', 'b', 'c', 'd' ], i++, log)) {
      await for (var s in makeStream(['a', 'b', 'c', 'd'], i++, log)) {
        await for (var s in makeStream(['a', 'b', 'c', 'd'], i++, log)) {
          await for (var s in makeStream(['a', 'b', 'c', 'd'], i++, log)) {
            skip--;
            if (skip == 0) {
              return;
            }
            yield s;
          }
        }
      }
    }
  }
}

Future test(int skip) async {
  List log = [];
  f(log, skip).listen(
      (_) { },
      onDone: () {
        Expect.listEquals([4, 3, 2, 1, 0], log);
      }
  );
}

main() {
  asyncStart();
  Future.wait(
    [test(1), test(2), test(3)]
  ).then(
    (_) => asyncEnd()
  );
}
