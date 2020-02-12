/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of the cast expression e as T proceeds as follows:
 * The expression e is evaluated to a value v.
 * Then, if T is malformed or deferred type, a dynamic error occurs.
 * Otherwise, if the interface of the class of v is a subtype of T, the cast
 * expression evaluates to v.
 * Otherwise, if v is null, the cast expression evaluates to v.
 * In all other cases, a CastError is thrown.
 * @description Checks that if T is a parameterized type of the form
 * G<T1,...,Tn> and G is generic type with different number of parameters, then
 * T is not malformed (see Types/Parameterized Types) and CastError is thrown,
 * not TypeError.
 * @author rodionov
 * @reviewer iefremov
 */
import '../../../Utils/expect.dart';

class G<S, T> {}

main() {
  // G is G<dynamic,dynamic>, not malformed
  Expect.throws(() => [] as G, (e) => e is TypeError || e is CastError);

  new G() as G;
}
