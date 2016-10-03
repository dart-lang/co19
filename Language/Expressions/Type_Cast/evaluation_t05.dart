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
 * G<T1,...,Tn> and G is unknown type, then it is a compile error
 * @compile-error
 * @author rodionov
 * @reviewer iefremov
 */

main() {
  1 as Unknown<int, bool>;
}
