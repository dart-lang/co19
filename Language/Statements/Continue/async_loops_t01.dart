/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  If sE is an asynchronous for loop, let ak be the set of
 * asynchronous for loops and yield-each statements enclosing sc that are
 * enclosed in sE , 1 ≤ k ≤ m, where ak is enclosed in ak+1 . The stream
 * subscriptions associated with aj are canceled, 1 ≤ j ≤ m, innermost first,
 * so that aj is canceled before aj+1 .
 *
 * @description Check that continue statement cancels all streams associated
 * with enclosing asynchronous loops, except sE
 *
 * @author a.semenov@unipro.ru
 */
import 'dart:async';
import '../../../Utils/expect.dart';
import 'stream_utils.dart' as StreamUtils;

Stream makeStream(Iterable iterable, int id, List log) {
  return StreamUtils.makeStream(iterable, beforeCancel: () { log.add(id); });
}

Future test1() async {
  List log = [];
  int i = 0;
  L:
  await for (String s in makeStream(['a0', 'b0'], i++, log)) {
    log.add(s);
    await for (String s in makeStream(['a1', 'b1'], i++, log)) {
      continue L;
      log.add(s);
    }
  }
  Expect.listEquals(['a0', 1, 'b0', 2], log);
}

Future test2() async {
  List log = [];
  int i = 0;

  L:
  await for (String s in makeStream(['a0', 'b0'], i++, log)) {
    await for (String s in makeStream(['a1', 'b1'], i++, log)) {
      await for (String s in makeStream(['a2', 'b2'], i++, log)) {
        await for (String s in makeStream(['a3', 'b3'], i++, log)) {
          await for (String s in makeStream(['a4', 'b4'], i++, log)) {
            continue L;
            log.add(s);
          }
          log.add(s);
        }
        log.add(s);
      }
      log.add(s);
    }
    log.add(s);
  }
  Expect.listEquals([4, 3, 2, 1, 8, 7, 6, 5], log);
}

main() {
  asyncStart();
  Future.wait([test1(), test2()]).then((v) => asyncEnd());
}