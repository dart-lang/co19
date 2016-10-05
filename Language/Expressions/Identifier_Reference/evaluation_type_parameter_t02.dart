/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of an identifier expression e of the form id proceeds
 * as follows:
 * Let d be the innermost declaration in the enclosing lexical scope whose name
 * is id or id=. If no such declaration exists in the lexical scope, let d be
 * the declaration of the inherited member named id if it exists.
 * ...
 * • If d is a type parameter T, then the value of e is the value of the actual
 *   type argument corresponding to T that was passed to the generative
 *   constructor that created the current binding of this. If, however, e occurs
 *   inside a static member, a compile-time error occurs.
 * @description Checks that there is a compile-time error if identifier
 * expression in a return statement refers to a type parameter inside a static
 * method.
 * @compile-error
 * @issue 27491
 * @author ngl@unipro.ru
 */
import '../../../Utils/expect.dart';

class A<T> {
  static Type func() => T;
}

main() {
  Expect.equals(int, A.func());
}
