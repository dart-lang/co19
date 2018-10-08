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
 * @description Check various mixes of synchronous and asynchronous for loops
 * with single continue statement.
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
    for (String s in ['a1','b1']) {
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
  for (String s in ['a0','b0']) {
    await for (String s in makeStream(['a1', 'b1'], i++, log)) {
      continue L;
      log.add(s);
    }
    log.add(s);
  }
  Expect.listEquals([0, 1], log);
}

Future test3() async {
  List log = [];
  int i = 0;

  for (String s in ['a0','b0']) {
    L:
    await for (String s in makeStream(['a1', 'b1'], i++, log)) {
      continue L;
      log.add(s);
    }
    log.add(s);
  }
  Expect.listEquals(['a0', 'b0'], log);
}

Future test4() async {
  List log = [];
  int i = 0;

  L:
  await for (String s in makeStream(['a0', 'b0'], i++, log)) {
    for (String s in ['a1', 'b1']) {
      await for (String s in makeStream(['a2', 'b2'], i++, log)) {
        for (String s in ['a3', 'b3']) {
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
  Expect.listEquals([2, 1, 4, 3], log);
}

Future test5() async {
  List log = [];
  int i = 0;

  L:
  for (String s in ['a0', 'b0']) {
    await for (String s in makeStream(['a1', 'b1'], i++, log)) {
      for (String s in ['a2', 'b2']) {
        await for (String s in makeStream(['a3', 'b3'], i++, log)) {
          for (String s in ['a4', 'b4']) {
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
  Expect.listEquals([1, 0, 3, 2], log);
}

Future test6() async {
  List log = [];
  int i = 0;

  for (String s in ['a0', 'b0']) {
    L:
    await for (String s in makeStream(['a1', 'b1'], i++, log)) {
      for (String s in ['a2', 'b2']) {
        await for (String s in makeStream(['a3', 'b3'], i++, log)) {
          for (String s in ['a4', 'b4']) {
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
  Expect.listEquals([1, 2, 'a0', 4, 5, 'b0'], log);
}

Future test7() async {
  List log = [];
  int i = 0;

  for (String s in ['a0', 'b0']) {
    await for (String s in makeStream(['a1', 'b1'], i++, log)) {
      L:
      for (String s in ['a2', 'b2']) {
        await for (String s in makeStream(['a3', 'b3'], i++, log)) {
          for (String s in ['a4', 'b4']) {
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
  Expect.listEquals(
      [1, 2, 'a1', 3, 4, 'b1', 'a0', 6, 7, 'a1', 8, 9, 'b1', 'b0'],
      log);
}

Future test8() async {
  List log = [];
  int i = 0;

  await for (String s in  makeStream(['a0', 'b0'], i++, log)) {
    for (String s in ['a1', 'b1']) {
      L:
      await for (String s in  makeStream(['a2', 'b2'], i++, log)) {
        for (String s in ['a3', 'b3']) {
          await for (String s in  makeStream(['a4', 'b4'], i++, log)) {
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
  Expect.listEquals(
      [2, 3, 'a1', 5, 6, 'b1', 'a0', 8, 9, 'a1', 11, 12, 'b1', 'b0'],
      log);
}

main() {
  asyncStart();
  Future.wait([
    test1(), test2(), test3(), test4(),
    test5(), test6(), test7(), test8()
  ]).then((v) => asyncEnd());
}