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
 * @description Checks that any specified statement can be in a body
 * of a function of the form [functionSignature '{' statements '}']
 *
 * @author msyabro
 * @reviewer kaigorodov
 */

class A {}

main() {
  //Blocks
  f_blocks() {{}}
  g_blocks() {int x; {int y;}}

  //Expression statements
  f_expression() {2 + 3;}
  g_expression() {"string";}
  h_expression() {;}

  //Variable declaration
  f_declaration() {int x;}
  g_declaration() {A a;}

  //If
  f_if() {if (1 > 0) {true;}}
  g_if() {if (1 > 0) {true;} else {false;}}

  //For
  f_for() {for (int i = 0; i < 100; i++) {i--;}}
  g_for() {for (int i in [1, 2, 3, 4, 5]) ;}

  //While
  f_while() {while (true) true;}

  //Do
  f_do() {do f_blocks(); while (true);}

  //Switch
  f_switch() {
    switch (1 + 1) {
      case 1:
        false;
        break;
      case 2:
        true;
        break;
      default:
        false;
        break;
    }
  }

  //Try
  f_try() {try {} catch (e) {}}
  g_try() {try {throw "exception";} on String catch (s) {} finally {}}

  //Return
  f_return() {return 1;}

  //Labels
  f_label() {label: int x;}

  //Break
  f_break() {while (true) {break;}}
  g_break() {label: while (true) {break label;}}

  //Continue
  f_continue() {while (true) continue;}
  g_continue() {label: while (true) continue label;}

  //Throw
  f_throw() {throw "";}

  //Assert
  f_assert() {assert(true);}
}
