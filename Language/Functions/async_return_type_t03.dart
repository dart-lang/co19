/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static warning if the declared return type of a function
 * marked async may not be assigned to Future.
 *
 * @description Check that it is no compile time error, if the declared
 * return type of asynchronous function may be assigned to Future.
 *
 * @author a.semenov@unipro.ru
 */
import 'dart:async';

dynamic a() async {
  return 'a';
}

Future b() async {
  return 'b';
}

main() {
  a();
  b();
}
