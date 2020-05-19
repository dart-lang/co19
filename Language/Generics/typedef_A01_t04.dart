/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A generic type alias is a declaration [D] of one of the following
 * forms:
 *    m typedef id<X1extendsB1, ..., Xs extendsBs> = T;
 * ...
 * where [m] is derived from metadata, [T] is a type, and [S?] is a type or the
 * empty string. Let [S0] be [S?] if it is a type, otherwise let [S0] be
 * [dynamic]. The associated type of [D], call it [F], is, respectively:
 *   T
 * ...
 * @description Checks that generic type alias declaration can contain metadata.
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=nonfunction-type-aliases
import "../../Utils/expect.dart";

const i = 1;
class A { const A(); }

@i typedef Alias1<T> = Function<T1 extends T>();
@i typedef Alias2<T> = void Function<T1 extends T>(T);
@i typedef Alias3<T> = T Function<T1 extends T>(T);
@i typedef Alias4<T> = String Function<T1 extends T>(T);
@i typedef Alias5<T> = Function<T1 extends T>(int, int, T);
@i typedef Alias6<T> = Function<T1 extends T>(int, int, T, [T]);
@i typedef Alias7<T> = Function<T1 extends T>(int, [T, T, T]);

@A() typedef Alias9<T1, T2> = T1 Function<TT1 extends T1, TT2 extends T2>();
@A() typedef Alias10<T1, T2> =
    T1 Function<TT1 extends T1, TT2 extends T2>(T2, {int a});
@A() typedef Alias11<T1, T2> =
    T1 Function<TT1 extends T1, TT2 extends T2>([T1 a1, T2 a2]);

main() {
}
