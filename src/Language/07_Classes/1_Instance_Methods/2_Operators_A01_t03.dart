/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * operatorSignature: returnType? operator operator formalParameterList ;
 * operator: unaryOperator | binaryOperator | '[]' | '[]=' | negate | call | equals;
 * unaryOperator: negateOperator ;
 * binaryOperator: multiplicativeOperator | additiveOperator | shiftOperator |
 *   relationalOperator | equalityOperator | bitwiseOperator ;
 * prefixOperator: '-' | negateOperator ;
 * negateOperator: '!' | '~' ;
 * @description Checks that it is a compile-time error if a class attempts to define
 * an operator without a name (basically, an instance method named 'operator').
 * @author iefremov
 * @compile-error
 * @reviewer pagolubev
 * @reviewer rodionov
 * @needsreview operator is a pseudo-keyword. Issue 379
 */

class C {
  int operator(var v) {}
}

main() {
  try {
    C c = new C();
  } catch(var x) {}
}

