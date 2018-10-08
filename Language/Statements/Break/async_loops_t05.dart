/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  Furthermore, let ak be the set of asynchronous for loops and
 * yield-each statements enclosing sb that are enclosed in sE , 1 ≤ k ≤ m,
 * where ak is enclosed in ak+1 . The stream subscriptions associated with aj
 * are canceled, 1 ≤ j ≤ m, innermost first, so that aj is canceled before
 * aj+1.
 *
 * @description Test various enclosing combinations of asynchronous and
 * synchronous for loops with several break statements
 *
 * @author a.semenov@unipro.ru
 */
import 'dart:async';
import '../../../Utils/expect.dart';

StreamController<String> newStreamControllerString(int id, List<int> log) {
  StreamController<String> sc = new StreamController<String>();
  sc.add('a' + id.toString());
  sc.add('b' + id.toString());
  sc.onCancel = () {
    log.add(id);
  };
  return sc;
}

Future test1() async {
  List<int> log = [];

  L4:
  await for (String s in newStreamControllerString(2, log).stream) {
    L3:
    for (String s in ['a','b']) {
      L2:
      await for (String s in newStreamControllerString(1, log).stream) {
        L1:
        for (String s in ['a','b']) {
          L0:
          await for (String s in newStreamControllerString(0, log).stream) {
            break L0;
          }
          break L1;
        }
        break L2;
      }
      break L3;
    }
    break L4;
  }
  Expect.listEquals([0, 1, 2], log);
}

Future test2() async {
  List<int> log = [];

  L0:
  for (String s in ['a','b']) {
    L1:
    await for (String s in newStreamControllerString(0, log).stream) {
      L2:
      for (String s in ['a','b']) {
        L3:
        await for (String s in newStreamControllerString(1, log).stream) {
          L4:
          for (String s in ['a','b']) {
            break L4;
          }
          await for (String s in newStreamControllerString(2, log).stream) {
            break L3;
          }
        }
        for (String s in ['a','b']) {
          await for (String s in newStreamControllerString(3, log).stream) {
            break L1;
          }
        }
      }
    }
    break L0;
  }
  Expect.listEquals([2, 1, 3, 0], log);
}

Future test3() async {
  List<int> log = [];

  L0:
  await for (String s in newStreamControllerString(0, log).stream) {
    L1:
    for (String s in ['a','b']) {
      break L0;
      L2:
      await for (String s in newStreamControllerString(1, log).stream) {
        L3:
        for (String s in ['a','b']) {
          L4:
          await for (String s in newStreamControllerString(2, log).stream) {
            break L4;
          }
          for (String s in ['a','b']) {
            break L3;
          }
        }
        await for (String s in newStreamControllerString(3, log).stream) {
          for (String s in ['a','b']) {
            break L1;
          }
        }
      }
    }
    break L0;
  }
  Expect.listEquals([0], log);
}


Future test4() async {
  List<int> log = [];
  int i = 0;

  for (String s in ['a','b']) {
    var streamController0 = newStreamControllerString(i++, log);
    await for (String s in streamController0.stream) {
      L1:
      for (String s in ['a','b']) {
        await for (String s in newStreamControllerString(i++, log).stream) {
          break L1;
        }
      }
      L2:
      await for (String s in newStreamControllerString(i++, log).stream) {
        for (String s in ['a','b']) {
          break L2;
        }
      }
      if (s.startsWith("b")) {
        streamController0.close();
      }
    }
  }
  Expect.listEquals([1, 2, 3, 4, 0,  6, 7, 8, 9, 5], log);
}
main() {
  asyncStart();
  Future.wait([test1(), test2(), test3(), test4()]).then((v) => asyncEnd());
}