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
 * canceled and there is an enclosing try finally statement, the finally
 * clause is executed.
 *
 * @issue #25748
 * @author a.semenov@unipro.ru
 */
import 'dart:async';
import '../../../../Utils/expect.dart';

bool cancelHandled = false;

Stream<int> generator(Stream<int> input) async* {
bool cancelled;
  try {
    cancelled = true;
    yield* input;
    cancelled = false;
  } finally {
    if (cancelled) {
      cancelHandled = true;
    }
  }
}

Future test() async {
  List log = [];
  StreamController<int> sc = new StreamController<int>();
  Stream<int> s = generator(sc.stream);
  StreamSubscription<int> ss = s.listen(
      (int i) {
        log.add(i);
      }
  );
  sc.add(1);
  sc.add(2);
  sc.add(3);
  await new Future.delayed(new Duration(milliseconds: 100));
  ss.cancel();
  sc.add(4);
  sc.add(5);
  await new Future.delayed(new Duration(milliseconds: 100));
  Expect.listEquals([1,2,3], log);
  Expect.isTrue(cancelHandled);
  await sc.close();
}

main() {
  asyncStart();
  test().then((_) => asyncEnd());
}
