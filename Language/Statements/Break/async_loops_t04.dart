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
 * @description Check various mixes of synchronous and asynchronous for loops
 * with single break statement.
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

  L:
  await for (String s in newStreamControllerString(0, log).stream) {
    for (String s in ['a','b']) {
      break L;
    }
  }
  Expect.listEquals([0], log);
}

Future test2() async {
  List<int> log = [];

  L:
  for (String s in ['a','b']) {
    await for (String s in newStreamControllerString(0, log).stream) {
      break L;
    }
  }
  Expect.listEquals([0], log);
}

Future test3() async {
  List<int> log = [];
  int i = 0;

  for (String s in ['a','b']) {
    L:
    await for (String s in newStreamControllerString(i++, log).stream) {
      break L;
    }
  }
  Expect.listEquals([0, 1], log);
}

Future test4() async {
  List<int> log = [];
  int i = 0;

  L:
  await for (String s in newStreamControllerString(2, log).stream) {
    for (String s in ['a', 'b']) {
      await for (String s in newStreamControllerString(1, log).stream) {
        for (String s in ['a', 'b']) {
          await for (String s in newStreamControllerString(0, log).stream) {
            break L;
          }
        }
      }
    }
  }
  Expect.listEquals([0, 1, 2], log);
}

Future test5() async {
  List<int> log = [];

  L:
  for (String s in ['a', 'b']) {
    await for (String s in newStreamControllerString(1, log).stream) {
      for (String s in ['a', 'b']) {
        await for (String s in newStreamControllerString(0, log).stream) {
          for (String s in ['a', 'b']) {
            break L;
          }
        }
      }
    }
  }
  Expect.listEquals([0, 1], log);
}

Future test6() async {
  List<int> log = [];
  int i = 0;

  for (String s in ['a', 'b']) {
    L:
    await for (String s in newStreamControllerString(i++, log).stream) {
      for (String s in ['a', 'b']) {
        await for (String s in newStreamControllerString(i++, log).stream) {
          for (String s in ['a', 'b']) {
            break L;
          }
        }
      }
    }
  }
  Expect.listEquals([1, 0, 3, 2], log);
}

Future test7() async {
  List<int> log = [];
  int i = 0;

  for (String s in ['a', 'b']) {
    var streamController = newStreamControllerString(i++, log);
    await for (String s in streamController.stream) {
      L:
      for (String s in ['a', 'b']) {
        await for (String s in newStreamControllerString(i++, log).stream) {
          for (String s in ['a', 'b']) {
            break L;
          }
        }
      }
      if (s.startsWith('b')) {
        streamController.close();
      }
    }
  }
  Expect.listEquals([1, 2, 0, 4, 5, 3], log);
}

Future test8() async {
  List<int> log = [];
  int i = 0;

  var streamController = newStreamControllerString(i++, log);
  await for (String s in streamController.stream) {
    for (String s in ['a', 'b']) {
      L:
      await for (String s in newStreamControllerString(i++, log).stream) {
        for (String s in ['a', 'b']) {
          await for (String s in newStreamControllerString(i++, log).stream) {
            break L;
          }
        }
      }
    }
    if (s.startsWith('b')) {
      streamController.close();
    }
  }
  Expect.listEquals([2, 1, 4, 3, 6, 5, 8, 7, 0], log);
}

main() {
  asyncStart();
  Future.wait([
    test1(), test2(), test3(), test4(),
    test5(), test6(), test7(), test8()
  ]).then((v) => asyncEnd());
}