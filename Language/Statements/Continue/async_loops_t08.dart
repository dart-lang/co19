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
 * @description Check various mixes of synchronous do-while and asynchronous for
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
  List<int> log = [];

  L:
  await for (String s in makeStream(['a', 'b'], 0, log)) {
    do {
      continue L;
    } while (log.length < 10);
  }
  Expect.listEquals([], log);
}

Future test2() async {
  List<int> log = [];
  int i = 0;

  L:
  do {
    await for (String s in makeStream(['a', 'b'], i++, log)) {
      continue L;
    }
  } while (log.length < 3);
  Expect.listEquals([0, 1, 2], log);
}

Future test3() async {
  List<int> log = [];
  int i = 0;

  do {
    L:
    await for (String s in makeStream(['a', 'b'], i++, log)) {
      continue L;
    }
  } while (i < 2);
  Expect.listEquals([], log);
}

Future test4() async {
  List<int> log = [];
  int i = 0;

  L:
  await for (String s in makeStream(['a0', 'b0'], i++, log)) {
    do {
      await for (String s in makeStream(['a1', 'b1'], i++, log)) {
        do {
          await for (String s in makeStream(['a2', 'b2'], i++, log)) {
            continue L;
          }
        } while (log.length < 10);
      }
    } while (log.length < 10);
  }
  Expect.listEquals([2, 1, 4, 3], log);
}

Future test5() async {
  List<int> log = [];
  int i = 0;

  L:
  do {
    await for (String s in makeStream(['a0', 'b0'], i++, log)) {
      do {
        await for (String s in makeStream(['a1', 'b1'], i++, log)) {
          do {
            continue L;
          } while (log.length < 10);
        }
      } while (log.length < 10);
    }
  } while (i < 4);
  Expect.listEquals([1, 0, 3, 2], log);
}

Future test6() async {
  List<int> log = [];
  int i = 0;

  do {
    L:
    await for (String s in makeStream(['a0', 'b0'], i++, log)) {
      do {
        await for (String s in makeStream(['a1', 'b1'], i++, log)) {
          do {
            continue L;
          } while (log.length < 10);
        }
      } while (log.length < 10);
    }
  } while (i < 4);
  Expect.listEquals([1, 2, 4, 5], log);
}

Future test7() async {
  List<int> log = [];
  int i = 0;
  do {
    await for (String s in makeStream(['a0', 'b0'], i++, log)) {
      int k = 0;
      L:
      do {
        k++;
        await for (String s in makeStream(['a1', 'b1'], i++, log)) {
          do {
            continue L;
          } while (log.length < 10);
        }
      } while (k < 2);
    }
  } while (i < 10);
  Expect.listEquals([1, 2, 3, 4, 6, 7, 8, 9], log);
}

Future test8() async {
  List<int> log = [];
  int i = 0;

  await for (String s in makeStream(['a0', 'b0'], i++, log)) {
    int k =  0;
    do {
      L:
      await for (String s in makeStream(['a1', 'b1'], i++, log)) {
        do {
          await for (String s in makeStream(['a2', 'b2'], i++, log)) {
            continue L;
          }
        } while (log.length < 10);
      }
      k++;
    } while (k < 2);
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