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
 * @description Test various enclosing combinations of asynchronous and
 * synchronous while loops with several continue statements
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
  List<int> log = [];
  int i = 0;

  L4:
  await for (String s in makeStream(['a0', 'b0'], i++, log)) {
    int j = 0;
    L3:
    while (j < 2) {
      j++;
      L2:
      await for (String s in makeStream(['a1', 'b1'], i++, log)) {
        int k = 0;
        L1:
        while (k < 2) {
          k++;
          L0:
          await for (String s in makeStream(['a2', 'b2'], i++, log)) {
            continue L0;
          }
          continue L1;
        }
        continue L2;
      }
      continue L3;
    }
    continue L4;
  }
  Expect.listEquals([], log);
}

Future test2() async {
  List<int> log = [];
  int i = 0;

  int j = 0;
  L0:
  while (j < 2) {
    j++;
    L1:
    await for (String s in makeStream(['a0', 'b0'], i++, log)) {
      int k = 0;
      L2:
      while (k < 2) {
        k++;
        L3:
        await for (String s in makeStream(['a1', 'b1'], i++, log)) {
          int n = 0;
          L4:
          while (n < 2) {
            n++;
            continue L4;
          }
          await for (String s in makeStream(['a2', 'b2'], i++, log)) {
            continue L3;
          }
        }
        int m = 0;
        while (m < 2) {
          m++;
          await for (String s in makeStream(['a3', 'b3'], i++, log)) {
            continue L1;
          }
        }
      }
    }
    continue L0;
  }
  Expect.listEquals([2, 3, 4, 6, 7, 8, 11, 12, 13, 15, 16, 17], log);
}

Future test3() async {
  List<int> log = [];

  L0:
  await for (String s in makeStream(['a', 'b'], 0, log)) {
    L1:
    while (log.length < 10) {
      continue L0;
      L2:
      await for (String s in makeStream(['a', 'b'], 1, log)) {
        L3:
        while (log.length < 10) {
          L4:
          await for (String s in makeStream(['a', 'b'], 2, log)) {
            continue L4;
          }
          for (String s in ['a','b']) {
            continue L3;
          }
        }
        await for (String s in makeStream(['a', 'b'], 3, log)) {
          while (log.length < 10) {
            continue L1;
          }
        }
      }
    }
    continue L0;
  }
  Expect.listEquals([], log);
}

Future test4() async {
  List<int> log = [];
  int i = 0;

  while (i < 9) {
    L0:
    await for (String s in makeStream(['a0', 'b0'], i++, log)) {
      L1:
      while (log.length < 3) {
        await for (String s in makeStream(['a1', 'b1'], i++, log)) {
          continue L1;
        }
      }
      L2:
      await for (String s in makeStream(['a1', 'b1'], i++, log)) {
        while (log.length < 9) {
          continue L0;
        }
      }
    }
  }
  Expect.listEquals([1, 2, 3, 4, 5, 7, 8], log);
}

main() {
  asyncStart();
  Future.wait([test1(), test2(), test3(), test4()]).then((v) => asyncEnd());
}