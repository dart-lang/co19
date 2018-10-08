/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The return statement returns a result to the caller of a
 * synchronous function, completes the future associated with an asynchronous
 * function or terminates the stream or iterable associated with a generator.
 * returnStatement:
 *   return expression? ';'
 * ;
 * @description Check that statement 'return e;' is accepted as valid in
 * asynchronous static method.
 *
 * @author a.semenov@unipro.ru
 */
import 'dart:async';
import '../../../Utils/expect.dart';

class A {
  static Future test() async {
    return 1;
  }
}

main() {
  asyncStart();
  A.test().then((value) {
    Expect.equals(1, value);
    asyncEnd();
  });
}
