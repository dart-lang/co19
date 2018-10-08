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
 * @description Test various enclosing combinations of asynchronous for loops
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
  await for (String s in newStreamControllerString(4, log).stream) {
    L3:
    await for (String s in newStreamControllerString(3, log).stream) {
      L2:
      await for (String s in newStreamControllerString(2, log).stream) {
        L1:
        await for (String s in newStreamControllerString(1, log).stream) {
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
  Expect.listEquals([0, 1, 2, 3, 4], log);
}

Future test2() async {
  List<int> log = [];

  L0:
  await for (String s in newStreamControllerString(0, log).stream) {
    L1:
    await for (String s in newStreamControllerString(1, log).stream) {
      L2:
      await for (String s in newStreamControllerString(2, log).stream) {
        L3:
        await for (String s in newStreamControllerString(3, log).stream) {
          L4:
          await for (String s in newStreamControllerString(4, log).stream) {
            break L4;
          }
          await for (String s in newStreamControllerString(5, log).stream) {
            break L3;
          }
        }
        await for (String s in newStreamControllerString(6, log).stream) {
          await for (String s in newStreamControllerString(7, log).stream) {
            break L1;
          }
        }
      }
    }
    break L0;
  }
  Expect.listEquals([4, 5, 3, 7, 6, 2, 1, 0], log);
}

Future test3() async {
  List<int> log = [];

  L0:
  await for (String s in newStreamControllerString(0, log).stream) {
    L1:
    await for (String s in newStreamControllerString(1, log).stream) {
      break L0;
      L2:
      await for (String s in newStreamControllerString(2, log).stream) {
        L3:
        await for (String s in newStreamControllerString(3, log).stream) {
          L4:
          await for (String s in newStreamControllerString(4, log).stream) {
            break L4;
          }
          await for (String s in newStreamControllerString(5, log).stream) {
            break L3;
          }
        }
        await for (String s in newStreamControllerString(6, log).stream) {
          await for (String s in newStreamControllerString(7, log).stream) {
            break L1;
          }
        }
      }
    }
    break L0;
  }
  Expect.listEquals([1, 0], log);
}


Future test4() async {
  List<int> log = [];
  int i = 0;

  var streamController0 = newStreamControllerString(i++, log);
  await for (String s in streamController0.stream) {
    var streamController1 = newStreamControllerString(i++, log);
    await for (String s in streamController1.stream) {
      L1:
      await for (String s in newStreamControllerString(i++, log).stream) {
        await for (String s in newStreamControllerString(i++, log).stream) {
          break L1;
        }
      }
      L2:
      await for (String s in newStreamControllerString(i++, log).stream) {
        await for (String s in newStreamControllerString(i++, log).stream) {
          break L2;
        }
      }
      if (s.startsWith("b")) {
        streamController1.close();
      }
    }
    if (s.startsWith("b")) {
      streamController0.close();
    }
  }
  Expect.listEquals([3, 2, 5, 4, 7, 6, 9, 8, 1,
                      12, 11, 14, 13, 16, 15, 18, 17, 10, 0], log);
}
main() {
  asyncStart();
  Future.wait([test1(), test2(), test3(), test4()]).then((v) => asyncEnd());
}