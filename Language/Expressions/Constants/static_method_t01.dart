/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A simple or qualified identifier denoting a static
 * method is a constant expression.
 * @description Checks that identifier denoting a static method is a constant expression.
 * @author rodionov
 * @reviewer kaigorodov
 */

foo() {}

class C {
  static int stMethod() {}
  static final lst = const [stMethod, foo, main];
}

final lstTop = const [C.stMethod, foo, main];

main() {
  final lstLocal = const [C.stMethod, foo, main];
}
