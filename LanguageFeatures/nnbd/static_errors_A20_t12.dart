/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a warning to use a null aware operator (?., ?.., ??, ??=,
 * or ...?) on a non-nullable receiver.
 *
 * @description Check it is a warning to use a null aware operator (?., ?.., ??,
 * ??=, or ...?) on a non-nullable receiver. Test FutureOr<FutureOr<A>>
 * @author sgrekhov@unipro.ru
 * @issue 39598
 */
// SharedOptions=--enable-experiment=non-nullable
import "dart:async";

class A {}

main() {
  FutureOr<FutureOr<A>> a = new A();
  a?.toString();                                  //# 01: static type warning
  a?..toString();                                 //# 02: static type warning
  a ?? a;                                         //# 03: static type warning
  a ??= a;                                        //# 04: static type warning
  List<FutureOr<FutureOr<A>>> clist = [a, a];
  List<FutureOr<FutureOr<A>>> alist = [a, a, ...? clist]; //# 05: static type warning
}
