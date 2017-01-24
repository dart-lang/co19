/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if m is a member of class Object and
 * e is either a prefix object or a constant type literal.
 * @description Check that it is no compile-time error if in expression e.m
 * e is a parenthesized expression
 * @author sgrekhov@unipro.ru
 */

main() {
  var x = (int).toString;
}
