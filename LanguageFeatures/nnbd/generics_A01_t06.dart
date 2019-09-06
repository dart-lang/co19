/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The default bound of generic type parameters is treated as
 * [Object?].
 * @description Check that default function typedef type parameter is treated as
 * [Object?] statically.
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable

import "../../Utils/expect.dart";

typedef G1<T> = T Function();
typedef G2<T> = void Function(T);
typedef G3<T> = T Function<T1 extends T>();
typedef G4<T1, T2, T3> = T1 Function(T2, T3);

typedef G5<T> = void Function();
typedef G6<T1, T2, T3> = void Function();

Object? G3_expected<T extends Object?>() {
  return T;
}

F<G1<Object?>> test1(G1 source) {
  var fsource = toF(source);
  return fsource;
}

F<G2<Object?>> test2(G2 source) {
  var fsource = toF(source);
  return fsource;
}

F<G4<Object?, Object?, Object?>> test4(G4 source) {
  var fsource = toF(source);
  return fsource;
}

F<G5<Object?>> test5(G5 source) {
  var fsource = toF(source);
  return fsource;
}

F<G6<Object?, Object?, Object?>> test6(G6 source) {
  var fsource = toF(source);
  return fsource;
}

void main() {
  G3 source3 = G3_expected;
  source3();
}

