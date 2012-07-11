/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Functions include function declarations, methods, getters,
 * setters, constructors and function literals.
 * All functions have a signature and a body.
 * functionSignature:
 *   returnType? identifier formalParameterList
 * ;
 * returnType: void | type
 * ;
 * functionBody:
 *   '=>' expression ';' | block
 * ;
 * block:
 *   '{' statements '}'
 * ;
 * @description Checks that any specified expression can be a body
 * of a function of the form [functionSignature '=>' expression ';']
 * @author msyabro
 * @reviewer kaigorodov
 * @reviewer iefremov
 */

#import("06_Functions_A01_t03_lib.dart", prefix: "prfx");
class A {
  const A();
  
  static final a = 1;
}

class B {
  var p;

  //This
  method() => this;
  B() {}
}

main() {
  int x = 1;
  int y = 0;
  B b = new B();
  List l = new List.from([1, 2]);

  //Constants
  f_const() => const {"a" : 1, "b" : 2, "c" : 3};
  g_const() => const [];

  //null
  f_null() => null;

  //Numbers
  f_num() => 1;
  g_num() => -.0;
  h_num() => 0xa;

  //Booleans
  f_bool() => true;
  g_bool() => false;

  //Strings
  f_string() => "";
  g_string() => "str";
  h_string() => "$x";

  //Lists
  f_list() => [];
  g_list() => [1, "2"];

  //Maps
  f_map() => {"1" : 1, "2": 2};

  //Function expressions
  f_func() => num func(int z) {return z + 1;};
  // spec does not require a semicolon at the end of the block 
  // that is a function body in a function declaration statement
  f_func2() => num func(int z) {return z + 1;}
  
  // only one semicolon is fine here because the nested function expression
  // is not a statement and is parsed using a different grammar production (10.8) 
  g_func() => func() => 1;

  //Instance creation
  f_instance() => new B();
  g_instance() => const A();

  //Property extraction
  f_property() => b.p;
  g_property() => b.method;

  //Function invocation
  f_fInvocation() => f_property();

  //Method invocation
  f_mInvocation() => b.method();

  //Assignment
  f_assignment() => x = 3;
  g_assignment() => x *= 2;

  //Conditional
  f_conditional() => (1 > 0) ? (x = 2) : (x = 5);

  //Logical boolean expressions
  f_logical() => x > 1 && y < 2;
  g_logical() => x < 2 || y == 3;

  //Bitwise expressions
  f_bitwise() => x & y;
  g_bitwise() => x | y;
  h_bitwise() => x ^ y;

  //Equality
  f_equality() => x == y;
  g_equality() => x === y;
  h_equality() => x !== y;
  i_equality() => x != y;

  //Relational expressions
  f_relational() => x > y;
  g_relational() => y <= x;

  //Shift
  f_shift() => x << 1;
  g_shift() => y >> 2;

  //Additive expressions
  f_additive() => x + y;
  g_additive() => x - y;

  //Multiplicative expressions
  f_multiplicative() => x * y;
  g_multiplicative() => x / y;
  h_multiplicative() => x ~/ y;
  i_multiplicative() => x % y;

  //Unary expressions
  f_unari() => ++x;
  g_unari() => x--;
  h_unari() => -y;

  //Assignable expressions
  f_assignable() => l[1];

  //Identifier reference
  f_identifier() => x;
  g_identifier() => b;
  h_identifier() => prfx.foo;

  //Type test
  f_type() => x is String;
  g_type() => f_type is Function;
}
