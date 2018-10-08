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
 * @description Test various enclosing combinations of asynchronous loops and
 * switch statement with several break statements
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
  int i = 0;
  L:
  switch (i) {
    case 0:
    await for (String s in newStreamControllerString(i++, log).stream) {
      break L;
    }
  }
  Expect.listEquals([0], log);
}

Future test2() async {
  List<int> log = [];
  int i = 0;
  L:
  await for (String s in newStreamControllerString(i++, log).stream) {
    switch (s) {
      case 'a0':
        break;
      case 'b0':
        break L;
    }
  }
  Expect.listEquals([0], log);
}

Future test3() async {
  List<int> log = [];
  int i = 0;
  L:
  switch (i) {
    case 0:
      await for (String s in newStreamControllerString(i++, log).stream) {
        await for (String s in newStreamControllerString(i++, log).stream) {
          break L;
        }
      }
  }
  Expect.listEquals([1, 0], log);
}

Future test4() async {
  List<int> log = [];
  int i = 0;
  L:
  switch (i) {
    case 0:
      await for (String s in newStreamControllerString(i++, log).stream) {
        await for (String s in newStreamControllerString(i++, log).stream) {
          switch (s) {
            case 'a1':
              break;
            case 'b1':
              break L;
          }
        }
      }
      break;
  }
  Expect.listEquals([1, 0], log);
}

Future test5() async {
  List<int> log = [];
  int i = 0;
  L:
  await for (String s in newStreamControllerString(i++, log).stream) {
    M:
    switch (s) {
      case 'a0':
        await for (String s in newStreamControllerString(i++, log).stream) {
          switch (s) {
            case 'a1':
              break;
            case 'b1':
              break M;
          }
        }
        break;

      case 'b0':
        await for (String s in newStreamControllerString(i++, log).stream) {
          K:
          await for (String s in newStreamControllerString(i++, log).stream) {
            switch (s) {
              case 'a3':
                break;
              case 'b3':
                break K;
              case 'b4':
                break L;
            }
          }
        }
        break;
    }
  }
  Expect.listEquals([1, 3, 4, 2, 0], log);
}

main() {
  asyncStart();
  Future.wait(
      [test1(), test2(), test3(), test4(), test5()]
  ).then((v) => asyncEnd());
}