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
 * @description Checks that it is a compile-time error if an operator-specific method name
 * is used without the operator keyword.
 * @author iefremov
 * @reviewer pagolubev
 * @compile-error
 * @reviewer rodionov
 */

class C {
  int ~/(var v){}
}

main() {
  try {
    C c = new C();
    var x = c ~/ 'a';
  } catch(var x){}
}
