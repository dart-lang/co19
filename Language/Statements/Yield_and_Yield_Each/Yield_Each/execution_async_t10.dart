/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If m is marked async*, then:
 *    • It is a dynamic error if the class of o does not implement Stream.
 *  Otherwise
 *    • For each element x of o:
 *    – If the stream u associated with m has been paused, then execution
 * of m is suspended until u is resumed or canceled.
 *    – If the stream u associated with m has been canceled, then let c be
 * the finally clause of the innermost enclosing try-finally statement, if any.
 * If c is defined, let h be the handler induced by c. If h is defined,
 * control is transferred to h. If h is undefined, the immediately enclosing
 * function terminates.
 *    – Otherwise, x is added to the stream associated with m in the order
 * it appears in o. The function m may suspend.
 *    • If the stream o is done, execution of s is complete.
 *
 * @description Check that if the stream u associated with m has been
 * canceled and there are several enclosing try finally statement, then each
 * finally clause is executed in innermost-first order.
 *
 * @issue #25748
 * @author a.semenov@unipro.ru
 */
import 'dart:async';
import '../../../../Utils/expect.dart';

Stream<String> generator(Stream<String> input, List log) async* {
  bool cancelled;
  int order = 0;
  try {
    try {
      try {
        cancelled = true;
        yield* input;
        cancelled = false;
      } finally {
        if (cancelled) {
          log.add(order++);
        }
      }
    } finally {
      if (cancelled) {
        log.add(order++);
      }
    }
  } finally {
    if (cancelled) {
      log.add(order++);
    }
  }
}

Future test() async {
  List log = [];
  StreamController<String> sc = new StreamController<String>();
  Stream<String> s = generator(sc.stream, log);
  StreamSubscription<String> ss = s.listen(
      (String v) {
        log.add(v);
      }
  );
  sc.add('a');
  sc.add('b');
  sc.add('c');
  await new Future.delayed(new Duration(milliseconds: 100));
  ss.cancel();
  sc.add('d');
  sc.add('e');
  await new Future.delayed(new Duration(milliseconds: 100));
  Expect.listEquals(['a', 'b', 'c', 0, 1, 2], log);
  await sc.close();
}

main() {
  asyncStart();
  test().then((_) => asyncEnd());
}
