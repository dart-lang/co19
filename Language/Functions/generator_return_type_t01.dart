/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static warning if the declared return type of a function
 * marked sync* may not be assigned to Iterable. It is a static warning if
 * the declared return type of a function marked async* may not be assigned
 * to Stream.
 *
 * @description Check that static type warning is reported, if the declared
 * return type of synchronous generator function may not be assigned
 * to Iterable.
 *
 * @static-warning
 * @author a.semenov@unipro.ru
 */
import '../../Utils/dynamic_check.dart';

int f() sync* { } /// static type warning

String g() sync* { } /// static type warning

void h() sync* { } /// static type warning

dynamic a() sync* { } // ok

Iterable b() sync* { } // ok

class TestItearble<E> extends Iterable<E> {

  @override
  Iterator<E> get iterator => null;
}

TestItearble c() sync* { } // ok

main() {
  checkTypeError(f);
  checkTypeError(g);
  checkTypeError(h);
  a();
  b();
  checkTypeError(c);
}
