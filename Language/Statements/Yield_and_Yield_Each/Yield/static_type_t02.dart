/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let T be the static type of e and let f be the immediately
 * enclosing function. It is a static type warning if either:
 *  • the body of f is marked async* and the type Stream<T> may not be
 *  assigned to the declared return type of f.
 *  • the body of f is marked sync* and the type Iterable<T> may not be
 *  assigned to the declared return type of f.
 *
 * @description Check that static warning is issued, if the body of f is marked
 * async* and the type Stream<T> may not be assigned to the declared return
 * type of f.
 *
 * @author a.semenov@unipro.ru
 */
import 'dart:async';
import '../../../../Utils/expect.dart';
import '../../../../Utils/async_utils.dart';

Stream<String> generator() async* {
  yield 1; /// static type warning
}

main() {
  asyncStart();
  generator().first.then(
      (v) {
        Expect.equals(1, v);
        asyncEnd();
      }
  );
}
