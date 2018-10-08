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
 * @description Check that if the stream u associated with m has been paused,
 * then execution of m is suspended until u is resumed. Using Completer to
 * control generator execution before yield* statement.
 *
 * @author a.semenov@unipro.ru
 */
import 'dart:async';
import '../../../../Utils/expect.dart';

Stream<int> generator(Stream<int> input, Future startTrigger) async* {
  await startTrigger;
  yield* input;
}

Future test() async {
  List log = [];
  Completer c = new Completer();
  Stream<int> s = generator(new Stream.fromIterable([1, 2, 3]), c.future);
  StreamSubscription<int> ss = s.listen(
      (int i) {
        log.add(i);
      },
      onDone: () {
        Expect.listEquals(['a','b','c', 1, 2, 3], log);
        asyncEnd();
      }
  );
  ss.pause();
  c.complete(); // pass control to yield*
  log.add('a');
  await new Future.delayed(new Duration(milliseconds: 100));
  log.add('b');
  await new Future.delayed(new Duration(milliseconds: 100));
  log.add('c');
  ss.resume();
}

main() {
  asyncStart();
  test();
}
