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
 * bound. So the test checks that if generic class type parameter is not clearly
 * specified, it is treated as [dynamic] at runtime.
 * See also co19 issue #530.
 * @Issue 40367, 40368
 *
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong

import "../../Utils/expect.dart";

class A<T> {}
class B<T1, T2, T3> {}

main() {
  Expect.equals(typeOf<A<dynamic>>(), typeOf<A>());
  Expect.equals(typeOf<B<dynamic, dynamic, dynamic>>(), typeOf<B>());
}
