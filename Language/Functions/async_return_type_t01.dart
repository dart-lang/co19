/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static warning if the declared return type of a function
 * marked async may not be assigned to Future.
 *
 * @description Check that static type warning is reported, if the declared
 * return type of asynchronous function may not be assigned to Future.
 *
 * @static-warning
 * @author a.semenov@unipro.ru
 */
import 'dart:async';
import '../../Utils/dynamic_check.dart';

int f() async { /// static type warning
  return 1;
}

String g() async { /// static type warning
  return 'a';
}

void h() async { /// static type warning
  return null;
}

dynamic a() async { // ok
  return 'a';
}

Future b() async { // ok
  return 'b';
}

main() {
  checkTypeError(f);
  checkTypeError(g);
  checkTypeError(h);
  a();
  b();
}
