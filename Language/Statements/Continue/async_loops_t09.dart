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
 * synchronous do-while loops with several continue statements
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
    int k = 0;
    L3:
    do {
      k++;
      L2:
      await for (String s in makeStream(['a1', 'b1'], i++, log)) {
        int n = 0;
        L1:
        do {
          n++;
          L0:
          await for (String s in makeStream(['a2', 'b2'], i++, log)) {
            continue L0;
          }
          continue L1;
        } while (n < 2);
        continue L2;
      }
      continue L3;
    } while (k < 2);
    continue L4;
  }
  Expect.listEquals([], log);
}

Future test2() async {
  List<int> log = [];
  int i = 0;

  L0:
  do {
    L1:
    await for (String s in makeStream(['a0', 'b0'], i++, log)) {
      L2:
      do {
        L3:
        await for (String s in makeStream(['a1', 'b1'], i++, log)) {
          int k = 0;
          L4:
          do {
            k++;
            continue L4;
          } while (k < 2);
          await for (String s in makeStream(['a2', 'b2'], i++, log)) {
            continue L3;
          }
        }
        do {
          await for (String s in makeStream(['a3', 'b3'], i++, log)) {
            continue L1;
          }
        } while (log.length < 10);
      } while (log.length < 10);
    }
    continue L0;
  } while (i < 8);
  Expect.listEquals([2, 3, 4, 6, 7, 8], log);
}

Future test3() async {
  List<int> log = [];

  L0:
  await for (String s in makeStream(['a', 'b'], 0, log)) {
    L1:
    do {
      continue L0;
      L2:
      await for (String s in makeStream(['a', 'b'], 1, log)) {
        L3:
        do {
          L4:
          await for (String s in makeStream(['a', 'b'], 2, log)) {
            continue L4;
          }
          do {
            continue L3;
          } while (log.length < 10);
        } while (log.length < 10);
        await for (String s in makeStream(['a', 'b'], 3, log)) {
          do {
            continue L1;
          } while (log.length < 10);
        }
      }
    } while (log.length < 10);
    continue L0;
  }
  Expect.listEquals([], log);
}

Future test4() async {
  List<int> log = [];
  int i = 0;

  do {
    await for (String s in makeStream(['a', 'b'], i++, log)) {
      int k = 0;
      L1:
      do {
        k++;
        await for (String s in makeStream(['a', 'b'], i++, log)) {
          continue L1;
        }
      } while (k < 2);
      L2:
      await for (String s in makeStream(['a', 'b'], i++, log)) {
        do {
          continue L2;
        } while (log.length < 10);
      }
    }
  } while (i < 4);
  Expect.listEquals([1, 2, 4, 5], log);
}

main() {
  asyncStart();
  Future.wait([test1(), test2(), test3(), test4()]).then((v) => asyncEnd());
}