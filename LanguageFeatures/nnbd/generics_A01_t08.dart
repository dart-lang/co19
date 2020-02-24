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
 * alias is not clearly specified, it is treated as [dynamic] at runtime.
 *
 * See also co19 issue #530.
 * @Issue 40367, 40368
 *
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
 // Requirements=nnbd-strong

import "../../Utils/expect.dart";

typedef T    Function1<T>();
typedef void Function2<T>(T);
typedef T    Function3<T>(T);
typedef void Function4<T>();

typedef T1   Function5<T1, T2, T3>(T2, T3);

void main() {
  Expect.equals(typeOf<Function1<dynamic>>(), typeOf<Function1>());
  Expect.equals(typeOf<Function2<dynamic>>(), typeOf<Function2>());
  Expect.equals(typeOf<Function3<dynamic>>(), typeOf<Function3>());
  Expect.equals(typeOf<Function4<dynamic>>(), typeOf<Function4>());

  Expect.equals(
      typeOf<Function5<dynamic, dynamic, dynamic>>(), typeOf<Function5>());
}
