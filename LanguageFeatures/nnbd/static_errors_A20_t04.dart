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
 * ??=, or ...?) on a non-nullable receiver. Test legacy pre-NNBD types
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
import "legacy_library_lib.dart";

main() {
  A a = A();
  a?.foo();                                 //# 01: static type warning
  a?..foo();                                //# 02: static type warning
  a ?? new Object();                        //# 03: static type warning
  a ??= new Object();                       //# 04: static type warning
  List<A?> list = [A(), null];
  List<A> alist = [A(), A(), ...? list];    //# 05: static type warning
}
