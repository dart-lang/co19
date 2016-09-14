/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let T be the static type of e and let f be the immediately
 * enclosing function. It is a static type warning if T may not be assigned
 * to the declared return type of f. If f is synchronous it is a static type
 * warning if T may not be assigned to Iterable. If f is asynchronous it is
 * a static type warning if T may not be assigned to Stream.
 *
 * @description Check that compile-error is issued, if the body of f is marked
 * sync* and the type T may not be assigned to the declared return
 * type of f.
 *
 * @compile-error
 * @author a.semenov@unipro.ru
 */
import '../../../../Utils/dynamic_check.dart';

Iterable<String> generator() sync* {
  yield* 1;
}

main() {
  generator().first;
}
