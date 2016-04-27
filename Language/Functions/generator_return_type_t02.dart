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
 * return type of a function marked async* may not be assigned to Stream.
 *
 * @static-warning
 * @author a.semenov@unipro.ru
 */
import 'dart:async';
import '../../Utils/dynamic_check.dart';

int f() async* { } /// static type warning

String g() async* { } /// static type warning

void h() async* { } /// static type warning

dynamic a() async* { } // ok

Stream b() async* { } // ok

class TestStream<T> extends Stream<T> {

  @override
  StreamSubscription<T> listen(void onData(T event),
      {Function onError, void onDone(), bool cancelOnError}) => null;
}

TestStream c() async* { } // ok

main() {
  checkTypeError(f);
  checkTypeError(g);
  checkTypeError(h);
  a();
  b();
  checkTypeError(c);
}
