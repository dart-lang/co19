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
 * @description Check that continue statement do not cancel streams associated
 * with sE and with asynchronous loops, that enclose sE
 *
 * @issue 25247
 * @issue 25234
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

  await for (String s in makeStream(['a', 'b'], i++, log)) {
      L:
      await for (String s in makeStream(['a', 'b'], i++, log)) {
        continue L;
      }
    }
  Expect.listEquals([], log);
}

Future test2() async {
  List log = [];
  int i = 0;

  await for (String s in makeStream(['a', 'b'], i++, log)) {
    await for (String s in makeStream(['a', 'b'], i++, log)) {
      L:
      await for (String s in makeStream(['a', 'b'], i++, log)) {
        await for (String s in makeStream(['a', 'b'], i++, log)) {
          await for (String s in makeStream(['a', 'b'], i++, log)) {
            continue L;
          }
        }
      }
    }
  }
  Expect.listEquals([
      4, 3, 6, 5, 9, 8, 11, 10, 15, 14, 17, 16, 20, 19, 22, 21
    ], log);
}

main() {
  asyncStart();
  Future.wait([test1(), test2()]).then((v) => asyncEnd());
}