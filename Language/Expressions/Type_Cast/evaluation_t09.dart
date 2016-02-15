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
 * G<T1,...,Tn>, G is not generic type and Ti are malformed, then T is not
 * malformed (see Types/Parameterized Types) and CastError is thrown,
 * not TypeError.
 * @static-warning
 * @author ilya
 */
import '../../../Utils/expect.dart';

class G {}

main() {
  // G<Foo,Bar> is G<dynamic,dynamic> is G, not malformed
  Expect.throws(() => [] as G<Foo,Bar>, (e) => e is CastError);

  new G() as G<Foo,Bar>;
}
