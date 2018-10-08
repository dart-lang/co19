/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let u be the stream associated with the immediately enclosing
 * asynchronous for loop or generator function, if any. If another event Eu
 * of u occurs before execution of s is complete, handling of Eu must wait
 * until s is complete.
 *
 * @description Check that all iterations of inner loop are complete before
 * outer loop proceed with its new event.
 * @author a.semenov@unipro.ru
 */
import 'dart:async';
import '../../../../Utils/expect.dart';


Future test1() async {
  List log = [];
  StreamController<String> streamController = new StreamController<String>();
  streamController.add('a');
  await for (String s in streamController.stream) {
    log.add(s);
    await for (int k in new Stream.fromIterable([1, 2])) {
      log.add(s + k.toString());
      if (log.length <= 4) {
        streamController.add(k.toString());
      } else if (!streamController.isClosed) {
        streamController.close();
      }
    }
  }
  Expect.listEquals(['a', 'a1', 'a2', '1', '11', '12', '2', '21', '22'], log);
}


Future test2() async {
  List log = [];
  StreamController<String> streamController = new StreamController<String>();
  streamController.add('a');
  await for (String s in streamController.stream) {
    log.add(s);
    await for (int k in new Stream.fromIterable([1, 2])) {
      log.add(s + k.toString());
      if (log.length <= 3) {
        streamController.add(k.toString());
      } else if (!streamController.isClosed) {
        streamController.close();
      }
      await new Future.delayed(new Duration(microseconds: 100));
    }
  }
  Expect.listEquals(['a', 'a1', 'a2', '1', '11', '12', '2', '21', '22'], log);
}

main() {
  asyncStart();
  Future.wait([test1(), test2()]).then((v) => asyncEnd());
}
