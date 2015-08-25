/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A constant constructor invocation is a constant expression.
 * @description Checks that a value created using constant constructor can be
 * an element of a constant list literal and is, therefore, a constant expression.
 * @author iefremov
 * @reviewer rodionov
 */
import '../../../Utils/expect.dart';

class A {
  const A() : a = "hello";
  final a;
}

final constList = const [
  const A()
];

main() {
  Expect.isTrue(constList is List);
}
