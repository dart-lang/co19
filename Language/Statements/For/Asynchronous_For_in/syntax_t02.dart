/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if an asynchronous for-in statement
 * appears inside a synchronous function. It is a compile-time error if
 * a traditional for loop is prefixed by the await keyword.
 *
 * @description Check that it is a compile-time error if an asynchronous
 * for-in statement appears inside a synchronous generator function
 *
 * @compile-error
 * @author a.semenov@unipro.ru
 */
import 'dart:async';

main() sync* {
  await for (var i in new Stream.fromIterable([1, 2])) break;
}
