/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The default bound of generic type parameters is treated as
 * [Object?].
 * @description Check that default class type parameter is treated as [Object?]
 * statically.
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable

import "../../Utils/expect.dart";

class A<T> {}

class B<T1, T2, T3> {}

main() {
  A? source;
  var fsource = toF(source);
  F<A<dynamic>> target = fsource;

  B? sourceB;
  var fsourceB = toF(sourceB);
  F<B<dynamic, dynamic, dynamic>> targetB = fsourceB;
}
