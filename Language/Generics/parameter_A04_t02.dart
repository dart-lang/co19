/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 *    typeParameter ::= metadata identifier (extends typeNotVoid)?
 *    typeParameters ::= ‘<’ typeParameter (‘,’ typeParameter)* ‘>’
 * ...
 * Type parameters are declared in the type parameter scope of a class or
 * function. The type parameters of a generic [G] are in scope in the bounds of
 * all of the type parameters of [G].
 * @description Checks that typedef type parameter is in the type parameter
 * scope.
 * @author iarkh@unipro.ru
 */
import "../../Utils/expect.dart";

class A {}

typedef Test<X1 extends A, X2 extends X1> = X1 Function(X2);
typedef Expected1 = A Function(Null);
typedef Expected2 = A Function(A);

main() {
  Expect.equals(Expected1, Test);
  Expect.notEquals(Expected2, Test);
}
