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
 * @description Check that break cancels all streams associated
 * with enclosing asynchronous loops
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
  await for (String s in newStreamControllerString(1, log).stream) {
    await for (String s in newStreamControllerString(0, log).stream) {
      break L;
    }
  }
  Expect.listEquals([0, 1], log);
}

Future test2() async {
  List<int> log = [];

  L:
  await for (String s in newStreamControllerString(4, log).stream) {
    await for (String s in newStreamControllerString(3, log).stream) {
      await for (String s in newStreamControllerString(2, log).stream) {
        await for (String s in newStreamControllerString(1, log).stream) {
          await for (String s in newStreamControllerString(0, log).stream) {
            break L;
          }
        }
      }
    }
  }
  Expect.listEquals([0, 1, 2, 3, 4], log);
}

Future test3() async {
  List<int> log = [];

  L:
  await for (String s in newStreamControllerString(7, log).stream) {
    await for (String s in newStreamControllerString(6, log).stream) {
      await for (String s in newStreamControllerString(5, log).stream) {
        await for (String s in newStreamControllerString(4, log).stream) {
          await for (String s in newStreamControllerString(3, log).stream) {
            await for (String s in newStreamControllerString(2, log).stream) {
              await for (String s in newStreamControllerString(1, log).stream) {
                await for (String s in newStreamControllerString(0, log).stream) {
                  break L;
                }
              }
            }
          }
        }
      }
    }
  }
  Expect.listEquals([0, 1, 2, 3, 4, 5, 6, 7], log);
}


main() {
  asyncStart();
  Future.wait([test1(), test2(), test3()]).then((v) => asyncEnd());
}