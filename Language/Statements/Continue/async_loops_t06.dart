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
 * @description Check various mixes of synchronous while and asynchronous for
 * loops with single continue statement.
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

  L:
  await for (String s in makeStream(['a0', 'b0'], 0, log)) {
    while (log.length < 10) {
      continue L;
      log.add(s);
    }
    log.add(s);
  }
  Expect.listEquals([], log);
}

Future test2() async {
  List log = [];
  int i = 0;

  L:
  while (i < 2) {
    await for (String s in makeStream(['a0', 'b0'], i++, log)) {
      continue L;
      log.add(s);
    }
  }
  Expect.listEquals([0, 1], log);
}

Future test3() async {
  List log = [];
  int i = 0;

  while (i < 2) {
    L:
    await for (String s in makeStream(['a0', 'b0'], i++, log)) {
      continue L;
      log.add(s);
    }
  }
  Expect.listEquals([], log);
}

Future test4() async {
  List log = [];
  int i = 0;

  L:
  await for (String s in makeStream(['a0', 'b0'], i++, log)) {
    while (log.length < 10) {
      await for (String s in makeStream(['a1', 'b1'], i++, log)) {
        while (log.length < 10) {
          await for (String s in makeStream(['a2', 'b2'], i++, log)) {
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
  Expect.listEquals([2, 1, 4, 3], log);
}

Future test5() async {
  List log = [];
  int i = 0;

  L:
  while (i < 4) {
    await for (String s in makeStream(['a0', 'b0'], i++, log)) {
      while (log.length < 10) {
        await for (String s in makeStream(['a1', 'b1'], i++, log)) {
          while (log.length < 10) {
            continue L;
          }
        }
      }
    }
  }
  Expect.listEquals([1, 0, 3, 2], log);
}

Future test6() async {
  List<int> log = [];
  int i = 0;

  while (i < 4) {
    L:
    await for (String s in makeStream(['a0', 'b0'], i++, log)) {
      while (log.length < 10) {
        await for (String s in makeStream(['a1', 'b1'], i++, log)) {
          while (log.length < 10) {
            continue L;
          }
        }
      }
    }
  }
  Expect.listEquals([1, 2, 4, 5], log);
}

Future test7() async {
  List<int> log = [];
  int i = 0;
  while (i < 8) {
    await for (String s in makeStream(['a0', 'b0'], i++, log)) {
      int k = 0;
      L:
      while (k < 2) {
        k++;
        await for (String s in makeStream(['a1', 'b1'], i++, log)) {
          while (log.length < 10) {
            continue L;
          }
        }
      }
    }
  }
  Expect.listEquals([1, 2, 3, 4, 6, 7, 8, 9], log);
}

Future test8() async {
  List<int> log = [];
  int i = 0;

  await for (String s in makeStream(['a0', 'b0'], i++, log)) {
    int k =  0;
    while (k < 2) {
      L:
      await for (String s in makeStream(['a1', 'b1'], i++, log)) {
        while (log.length < 10) {
          await for (String s in makeStream(['a2', 'b2'], i++, log)) {
            continue L;
          }
        }
      }
      k++;
    }
  }
  Expect.listEquals([2, 3, 5, 6, 8, 9, 11, 12], log);
}

main() {
  asyncStart();
  Future.wait([
    test1(), test2(), test3(), test4(),
    test5(), test6(), test7(), test8()
  ]).then((v) => asyncEnd());
}