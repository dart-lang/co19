/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if the function immediately enclosing
 * a is not declared asynchronous. However, this error is simply a syntax
 * error, because in the context of a normal function, await has no special
 * meaning.
 *
 * @description Check that it is a compile error if the function immediately
 * enclosing await expression is not marked with async, async* or sync*
 * @compile-error
 * @author a.semenov@unipro.ru
 */
import 'dart:async';
import '../../../Utils/expect.dart';

f() {
  return new Future<int>.value(1);
}

main() {
  await f();
}
