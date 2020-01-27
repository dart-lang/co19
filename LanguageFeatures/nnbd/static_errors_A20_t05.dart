/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a warning to use a null aware operator (?., ?.., ??, ??=,
 * or ...?) on an expression of type T if T is strictly non-nullable.
 *
 * @description Check it is a warning to use a null aware operator (?., ?.., ??,
 * ??=, or ...?) on a strictly non-nullable receiver. Test Function type
 * @author sgrekhov@unipro.ru
 * @issue 39598
 * @issue 39714
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
void foo() {}
void bar() {}

main() {
  Function a = foo;
  a?.toString();                                  //# 01: static type warning
  a?..toString();                                 //# 02: static type warning
  a ?? bar;                                       //# 03: static type warning
  a ??= bar;                                      //# 04: static type warning
  List<Function> clist = [foo, bar];
  List<Function> alist = [foo, bar, ...? clist];  //# 05: static type warning
}
