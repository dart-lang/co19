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
 * @description Check that compile error is issued, if the body of f is marked
 * sync* and the type Iterable<T> may not be assigned to the declared return
 * type of f.
 *
 * @compile-error
 * @author a.semenov@unipro.ru
 */
import '../../../../Utils/expect.dart';

Iterable<String> generator() sync* {
  yield 1;
}

main() {
  Expect.equals(1, generator().first);
}
