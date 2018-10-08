/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
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
 * @description Test various enclosing combinations of asynchronous loops and
 * switch statement with several continue statements
 *
 * @issue 24935
 * @issue 25234
 * @issue 25310
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

  switch (i) {
    case 0:
      await for (String s in makeStream(['a', 'b'], i++, log)) {
        continue L;
      }
      break;
    L: case 1:
      break;
  }
  Expect.listEquals([0], log);
}

Future test2() async {
  List<int> log = [];
  int i = 0;
  L:
  await for (String s in makeStream(['a0', 'b0'], i++, log)) {
    switch (s) {
      case 'a0':
        continue;
      case 'b0':
        continue L;
    }
  }
  Expect.listEquals([], log);
}

Future test3() async {
  List<int> log = [];
  int i = 0;

  switch (i) {
    case 0:
      await for (String s in makeStream(['a', 'b'], i++, log)) {
        await for (String s in makeStream(['a', 'b'], i++, log)) {
          continue L;
        }
      }
      break;
    L: case 2:
      await for (String s in makeStream(['a', 'b'], i++, log)) {
        await for (String s in makeStream(['a', 'b'], i++, log)) {
          continue M;
        }
      }
      break;
    M: default:
      break;
  }
  Expect.listEquals([1, 0, 3, 2], log); // crash here due to issue 24935
}

Future test4() async {
  List<int> log = [];
  int i = 0;

  switch (i) {
    case 0:
      await for (String s in makeStream(['a0', 'b0'], i++, log)) {
        await for (String s in makeStream(['a1', 'b1'], i++, log)) {
          switch (s) {
            case 'a1':
              continue;
            case 'b1':
              continue L;
          }
        }
      }
      break;
    L:
    case 2:
      break;
  }
  Expect.listEquals([1, 0], log);
}

Future test5() async {
  List<int> log = [];
  int i = 0;
  L:
  await for (String s in makeStream(['a0', 'b0'], i++, log)) {
    switch (s) {
      case 'a0':
        await for (String s in makeStream(['a1', 'b1', 'c1'], i++, log)) {
          switch (s) {
            case 'a1':
              continue;
            case 'b1':
              continue M; // issue 25310
          }
        }
        break;

      M:
      case 'b0':
        break;
    }
  }
  Expect.listEquals([1], log);
}

Future test6() async {
  List<int> log = [];
  int i = 0;
  L:
  await for (String s in makeStream(['a0', 'b0'], i++, log)) {
    switch (s) {
      case 'a0':
        await for (String s in makeStream(['a1', 'b1', 'c1'], i++, log)) {
          switch (s) {
            case 'a1':
              continue;
            case 'b1':
              continue M; // issue 25310
          }
        }
        break;

      M:
      case 'b0':
        print("M");
        await for (String s in makeStream(['a2', 'b2'], i++, log)) {
          List list = ['a'+i.toString(), 'b'+i.toString(), 'c'+i.toString()];
          K:
          await for (String s in makeStream(list, i++, log)) {
            switch (s) {
              case 'a3':
                continue;
              case 'b3':
                continue K;
              case 'b4':
                continue L;
            }
          }
        }
        break;
    }
  }
  Expect.listEquals([1, 4, 2], log);
}

main() {
  asyncStart();
  Future.wait(
      [test1(), test2(), test3(), test4(), test5(), test6()]
  ).then((v) => asyncEnd());
}
