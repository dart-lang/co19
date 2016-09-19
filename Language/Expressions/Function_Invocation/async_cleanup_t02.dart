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
 * terminated by return. f is asynchronous function.
 * @author a.semenov@unipro.ru
 */
import 'dart:async';
import '../../../Utils/expect.dart';
import '../../../Utils/async_utils.dart';
import 'stream_utils.dart' as StreamUtils;

Stream makeStream(Iterable iterable, int id, List log) {
  return StreamUtils.makeStream(iterable, beforeCancel: () { log.add(id); });
}

Future f(List log, int skip) async {
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
          }
        }
      }
    }
  }
}

test(int skip) async {
  asyncStart();
  List log = [];
  await f(log, skip);
  Expect.listEquals([4, 3, 2, 1, 0], log);
  asyncEnd();
}

main() {
  for (int skip = 1; skip < 4; skip++) {
    test(skip);
  }
}
