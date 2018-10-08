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
 * synchronous for loops with several continue statements
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
    L3:
    for (String s in ['a1','b1']) {
      L2:
      await for (String s in makeStream(['a2', 'b2'], i++, log)) {
        L1:
        for (String s in ['a3','b3']) {
          L0:
          await for (String s in makeStream(['a4', 'b4'], i++, log)) {
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

  L0:
  for (String s in ['a0','b0']) {
    L1:
    await for (String s in makeStream(['a1', 'b1'], i++, log)) {
      L2:
      for (String s in ['a2','b2']) {
        L3:
        await for (String s in makeStream(['a3', 'b3'], i++, log)) {
          L4:
          for (String s in ['a4','b4']) {
            continue L4;
          }
          await for (String s in makeStream(['a5', 'b5'], i++, log)) {
            continue L3;
          }
        }
        for (String s in ['a6','b6']) {
          await for (String s in makeStream(['a7', 'b7'], i++, log)) {
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
  int i = 0;

  L0:
  await for (String s in makeStream(['a0', 'b0'], i++, log)) {
    L1:
    for (String s in ['a1','b1']) {
      continue L0;
      L2:
      await for (String s in makeStream(['a2', 'b2'], i++, log)) {
        L3:
        for (String s in ['a3','b3']) {
          L4:
          await for (String s in makeStream(['a4', 'b4'], i++, log)) {
            continue L4;
          }
          for (String s in ['a5','b5']) {
            continue L3;
          }
        }
        await for (String s in makeStream(['a6', 'b6'], i++, log)) {
          for (String s in ['a7','b7']) {
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

  for (String s in ['a0','b0']) {
    await for (String s in makeStream(['a1', 'b1'], i++, log)) {
      L1:
      for (String s in ['a2','b2']) {
        await for (String s in makeStream(['a3', 'b3'], i++, log)) {
          continue L1;
        }
      }
      L2:
      await for (String s in makeStream(['a4', 'b4'], i++, log)) {
        for (String s in ['a5','b5']) {
          continue L2;
        }
      }
    }
  }
  Expect.listEquals([1, 2, 4, 5, 8, 9, 11, 12], log);
}

main() {
  asyncStart();
  Future.wait([test1(), test2(), test3(), test4()]).then((v) => asyncEnd());
}