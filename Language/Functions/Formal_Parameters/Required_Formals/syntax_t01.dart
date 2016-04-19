/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A required formal parameter may be specied in one of three ways:
 *
 * • By means of a function signature that names the parameter and describes
 *   its type as a function type. It is a compile-time error if any default
 *   values are specied in the signature of such a function type.
 * • As an initializing formal, which is only valid as a parameter to a
 *   generative constructor.
 * • Via an ordinary variable declaration
 *
 * normalFormalParameter:
 *   functionSignature |
 *   fieldFormalParameter |
 *   simpleFormalParameter
 * ;
 * simpleFormalParameter:
 *   declaredIdentifier |
 *   metadata identifier
 * ;
 * fieldFormalParameter:
 *   metadata finalConstVarOrType? this '.' identifier formalParameterList?
 * ;
 * @description Checks that various correct declarations with only required
 * formal parameters do not cause any errors.
 * @author msyabro
 * @reviewer iefremov
 * @reviewer rodionov
 */

func_func(void g(var x)) {}
func_var(var x) {}
func_final(final x) {}
func_finalTyped(final int x) {}
func_typed(int $) {}
func_undeclared(z) {}
func(var x, final y, int z, a, void f()) {}

class A<TypeParam> {
  A(this.x);
  A.named(TypeParam this.x);
  var x;
  method_func(void g(var x) ) {}
  method_var(var x) {}
  method_final(final x) {}
  method_finalTyped(final int x) {}
  method_typed(int x) {}
  method_undeclared(z) {}
  method(var x, final y, int z, a, void f()) {}
}

main() {
  func_func(null);
  func_var(null);
  func_final(null);
  func_finalTyped(null);
  func_typed(null);
  func_undeclared(1);
  func(1, 2, 3, 4, null);

  A a = new A(1);
  a = new A.named(1);
  a.method_func(null);
  a.method_var(null);
  a.method_final(null);
  a.method_finalTyped(null);
  a.method_typed(null);
  a.method_undeclared(1);
  a.method(1, 2, 3, 4, null);
}
