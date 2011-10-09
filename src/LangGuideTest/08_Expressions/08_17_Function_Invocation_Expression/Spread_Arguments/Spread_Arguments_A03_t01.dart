/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A function expression includes an argument expression list.
 * Each argument expression is a normal expression, except the last which may also be a spread expression.
 * @description Check that last argument can be a spread expression
 * @author msyabro
 */


void func2(...args) {}
void func1(...args) {
  func2(true == true, ...args);
}

void main() {}
