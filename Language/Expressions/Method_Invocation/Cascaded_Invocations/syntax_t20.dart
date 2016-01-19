/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A cascaded method invocation has the form e..suffix where e is
 * an expression and suffix is a sequence of operator, method, getter or
 * setter invocations.
 * cascadeSection:
 *   '..'  (cascadeSelector arguments*)(assignableSelector arguments*)*
 * (assignmentOperator expressionWithoutCascade)?
 * ;
 * cascadeSelector:
 *   '[' expression ']' |
 *   identifier
 * ;
 * @description Checks access to element of List and Map using cascade
 * invocation.
 * @author ngl@unipro.ru
 */
import '../../../../Utils/expect.dart';

main() {
  List l1 = [1, 2, 3, 4];
  List l2 = ['a', 'b', 'c'];
  Map m = {0:'a', 1:'b'};

  l1..[1] = (22)..[3] = 33;
  Expect.equals(22, l1[1]);
  Expect.equals(33, l1[3]);

  l2..[0] = 'dd'..[2] = 'ee';
  Expect.equals('dd', l2[0]);
  Expect.equals('ee', l2[2]);

  m..[0] = 'c'..[1] = 'd';
  Expect.equals('c', m[0]);
  Expect.equals('d', m[1]);
}
