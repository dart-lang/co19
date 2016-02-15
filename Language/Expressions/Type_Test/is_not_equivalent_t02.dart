/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The is-expression e is! T is equivalent to !(e is T).
 * @description Checks that type annotations does not affect the result of the
 * is!-expression
 * @author msyabro
 * @reviewer kaigorodov
 */
import '../../../Utils/expect.dart';

main() {
  int x;
  Expect.isTrue(x is! int);
  String s;
  Expect.isTrue(s is! String);
  bool b;
  Expect.isTrue(b is! bool);
}
