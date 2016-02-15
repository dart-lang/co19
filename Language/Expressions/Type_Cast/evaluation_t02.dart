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
 * @description Checks that the type cast operator evaluates to null when
 * the first argument evaluates to null.
 * @author rodionov
 * @reviewer kaigorodov
 */
import '../../../Utils/expect.dart';

n() => null;

class C {}
abstract class G<S, T> {}
typedef bool func(int);

main() {
    Expect.isNull(n() as int, "null expected");
    Expect.isNull(null as C, "null expected");
    Expect.isNull(n() as G<int, bool>, "null expected");
    Expect.isNull(n() as func, "null expected");
}
