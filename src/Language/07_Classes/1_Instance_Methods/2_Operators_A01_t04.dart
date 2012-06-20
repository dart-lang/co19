/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * operatorSignature: 
 *   returnType? operator operator formalParameterList 
 * ;
 * operator: 
 *   unaryOperator | 
 *   binaryOperator | 
 *   '[]' | 
 *   '[]=' | 
 *   negate | 
 *   equals
 * ;
 * unaryOperator: 
 *   negateOperator 
 * ;
 * binaryOperator: 
 *   multiplicativeOperator | 
 *   additiveOperator | 
 *   shiftOperator |
 *   relationalOperator | 
 *   equalityOperator | 
 *   bitwiseOperator 
 * ;
 * prefixOperator: 
 *   '-' | 
 *   negateOperator 
 * ;
 * negateOperator: 
 *   '!' |
 *   '~'
 * ;
 * @description Checks that it is a compile-time error if a class defines an
 * operator without a formal parameter list.
 * @author iefremov
 * @reviewer pagolubev
 * @reviewer rodionov
 * @compile-error
 */

class C {
  int operator negate {}
}

main() {
  try {
    C c = new C();
    var x = -c;
  } catch(var x){}
}
