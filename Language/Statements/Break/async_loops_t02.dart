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
 * @description Check that break do not cancel streams associated
 * with asynchronous loops, that enclose sE
 *
 * @issue 24956
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
  int i = 0;

  var streamController0 = newStreamControllerString(i++, log);
  await for (String s in streamController0.stream) {
    var streamController1 = newStreamControllerString(i++, log);
    await for (String s in streamController1.stream) {
      L:
      await for (String s in newStreamControllerString(i++, log).stream) {
        await for (String s in newStreamControllerString(i++, log).stream) {
          await for (String s in newStreamControllerString(i++, log).stream) {
            break L;
          }
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
  Expect.listEquals([4, 3, 2, 7, 6, 5, 1, 11, 10, 9, 14, 13, 12, 8, 0], log);
}

Future test2() async {
  List<int> log = [];
  int i = 1;
  StreamController<StreamController<String>> sc0 =
                        new StreamController<StreamController<String>>();
  sc0.add(newStreamControllerString(i++, log));
  sc0.add(newStreamControllerString(i++, log));
  sc0.onCancel = () {
    log.add(0);
  };

  await for (StreamController<String> sc in sc0.stream) {
    L:
    await for (String s in sc.stream) {
      await for (String s in newStreamControllerString(i++, log).stream) {
        break L;
      }
    }
    if (i > 4) {
      sc0.close();
    }
  }
  Expect.listEquals([3, 1, 4, 2, 0], log);
}


main() {
  asyncStart();
  Future.wait([test1(), test2()]).then((v) => asyncEnd());
}