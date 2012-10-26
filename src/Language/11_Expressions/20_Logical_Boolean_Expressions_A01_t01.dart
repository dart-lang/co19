/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The logical boolean expressions combine boolean objects using the boolean
 * conjunction and disjunction operators.
 * logicalOrExpression:
 *   logicalAndExpression ('||' logicalAndExpression)*
 * ;
 * logicalAndExpression:
 *   bitwiseOrExpression ('&&' bitwiseOrExpression)*
 * ;
 * A logical boolean expression is either a bitwise expression, or an
 * invocation of a logical boolean operator on an expression e1 with argument e2.
 * @description Checks that various expression which fit into this grammar
 * don't cause compile-time errors.
 * @author msyabro
 * @author kaigorodov
 * @reviewer rodionov
 */

import "../../Utils/dynamic_check.dart";

topLevelFunction() {}

class S {
  const S();
}

class A {
  int method() {return 3;}
  var id = 6;
  
  test() {
    var arr = [1, 2];
    
    //literals
    1 && "1";
    false || null;
    [1, 2, 3, 4] && {"1": 2, "3": 4};

    //constants and instance creation
    const [] || [];
    const {"a": 1} && {"a": 1};
    const S() && new A();

    //invocation
    id || topLevelFunction();
    this.method() && topLevelFunction();
    method() || id;

    //equality
    id == id || true == false;
    1 != 1 && 0;

    //logical and relational expressions
    1 < 2 || id > 1 ? 1 : id;
    [] && {} || 2 > 2.0;
    null || this && id <= 7;

    //bitwise and shift expressions
    arr[1] ^ method() && new S() & true;
    id | method() || id >> method();

    //additive expressions
    1 + 2 && 2;
    0 - 0 || id + method();

    //multiplicative expressions
    id * method() || id / arr[1];
    id % method() || id ~/ arr[1];

    //unary expressions
    --id || id++;
    ~-id && !!false;
    
    // selector operator invocations
    try {
      id[2.0] || topLevelFunction()[0] && [1, 2][0];
      Expect.fail("NoSuchMethodError expected.");
    } on NoSuchMethodError catch(ok) {}

     id && id || id; 

     //function expressions
     (){} || ()=>({});
     () {return null;} && (int x) => 7; // issue 1189
  }
}

main() {
  if(isCheckedMode()) {
    return; //this test is a nonsense in checked mode
  }
  A a = new A();
  a.test();
}
