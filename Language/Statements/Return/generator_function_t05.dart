/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if a return statement of the form
 * return e; appears in a generator function.
 *
 * @description Check that statement 'return e' cause a compiler error in
 * asynchronous generator function
 *
 * @compile-error
 * @author a.semenov@unipro.ru
 */
import 'dart:async';

Stream test() async* {
  return 1;
}

main() {
  test().isEmpty;
}
