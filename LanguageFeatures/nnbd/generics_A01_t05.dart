/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The default bound of generic type parameters is treated as
 * [Object?].
 *
 * @description It seems like it is not possible to obtain the value of the
 * default bound at runtime, we can only obtain the result of instantiation to
 * bound. So the test checks that if type parameter of the generic function
 * typedef is not clearly specified, it is treated as [dynamic] at runtime.
 * Typedef is in the form:
 *   [typedef <typeIdentifier> <typeParameters> = <functionType>].
 *
 * See also co19 issue #530.
 * @Issue 40367, 40368
 *
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong

import "../../Utils/expect.dart";

typedef G1<T> = T Function();
typedef G2<T> = void Function(T);
typedef G3<T> = void Function<T1 extends T>();
typedef G4<T1, T2, T3> = T1 Function(T2, T3);
typedef G5<T1, T2, T3, T4> = T1 Function<TT extends T2>(T3, T4);

typedef G6<T> = void Function();
typedef G7<T1, T2, T3> = void Function();

typedef G3_expected = void Function<T extends dynamic>();
typedef G5_expected = dynamic Function<T extends dynamic>(dynamic, dynamic);

main() {
  Expect.equals(typeOf<G1<dynamic>>(), typeOf<G1>());
  Expect.equals(typeOf<G2<dynamic>>(), typeOf<G2>());
  Expect.equals(G3_expected, G3);
  Expect.equals(typeOf<G4<dynamic, dynamic, dynamic>>(), typeOf<G4>());
  Expect.equals(G5_expected, G5);
  Expect.equals(typeOf<G6<dynamic>>(), typeOf<G6>());
  Expect.equals(typeOf<G7<dynamic, dynamic, dynamic>>(), typeOf<G7>());
}
