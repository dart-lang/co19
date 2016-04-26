/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The return statement returns a result to the caller of a
 * synchronous function, completes the future associated with an asynchronous
 * function or terminates the stream or iterable associated with a generator.
 * returnStatement:
 *   return expression? ';'
 * ;
 * @description Check that statement 'return;' is accepted as valid in
 * synchronous local generator.
 *
 * @author a.semenov@unipro.ru
 */
import '../../../Utils/expect.dart';

main() {
  Iterable test() sync* {
    return;
  }

  Expect.isTrue(test().isEmpty);
}
