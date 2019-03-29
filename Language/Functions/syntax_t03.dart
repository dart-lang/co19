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
 *   metadata returnType? identifier formalParameterList
 * ;
 * returnType: void | type
 * ;
 * functionBody:
 *   async? '=>' expression ';' | (async | async* | sync*)? block
 * ;
 * block:
 *   '{' statements '}'
 * ;
 *
 * @description Checks that any specified expression can be a body
 * of a function of the form [functionSignature '=>' expression ';']
 *
 * @author msyabro
 * @reviewer kaigorodov
 * @reviewer iefremov
 */
// SharedOptions=--enable-experiment=triple-shift

import "syntax_t03_lib.dart" as prfx;

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
  int y = 10;
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
  f_func() => (int z) {return z + 1;};

  // only one semicolon is fine here because the nested function expression
  // is not a statement and is parsed using a different grammar production
  g_func() => () => 1;

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
  g_equality() => identical(x, y);
  h_equality() => !identical(x, y);
  i_equality() => x != y;

  //Relational expressions
  f_relational() => x > y;
  g_relational() => y <= x;

  //Shift
  f_shift() => x << 1;
  g_shift() => y >> 2;

  //Triple shift
  triple_shift() => y >>> 2;

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

  // now call every function to force the compiler to parse it
  new B().method();
  //Constants
  f_const();
  g_const();

  //null
  f_null();

  //Numbers
  f_num();
  g_num();
  h_num();

  //Booleans
  f_bool();
  g_bool();

  //Strings
  f_string();
  g_string();
  h_string();

  //Lists
  f_list();
  g_list();

  //Maps
  f_map();

  //Function expressions
  f_func();

  g_func();

  //Instance creation
  f_instance();
  g_instance();

  //Property extraction
  f_property();
  g_property();

  //Function invocation
  f_fInvocation();

  //Method invocation
  f_mInvocation();

  //Assignment
  f_assignment();
  g_assignment();

  //Conditional
  f_conditional();

  //Logical boolean expressions
  f_logical();
  g_logical();

  //Bitwise expressions
  f_bitwise();
  g_bitwise();
  h_bitwise();

  //Equality
  f_equality();
  g_equality();
  h_equality();
  i_equality();

  //Relational expressions
  f_relational();
  g_relational();

  //Shift
  f_shift();
  g_shift();

  //Triple shift
  triple_shift();

  //Additive expressions
  f_additive();
  g_additive();

  //Multiplicative expressions
  f_multiplicative();
  g_multiplicative();
  h_multiplicative();
  i_multiplicative();

  //Unary expressions
  f_unari();
  g_unari();
  h_unari();

  //Assignable expressions
  f_assignable();

  //Identifier reference
  f_identifier();
  g_identifier();
  h_identifier();

  //Type test
  f_type();
  g_type();
}
