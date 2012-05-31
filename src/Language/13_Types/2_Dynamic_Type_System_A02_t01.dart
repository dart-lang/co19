/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A type T is malformed iff:
 *   T has the form id, and id does not denote a type available in the enclosing lexical scope.
 *   T is a parameterized type of the form G<S1, .., Sn>, and any of the following conditions hold:
 *   Either G or Si, 1 <= i <= n are malformed.
 *   G is not a generic type with n type parameters.
 *   Let Ti be the type parameters of G (if any) and let Bi be the bound of Ti, 1 <= i <= n,
 * and Si is not a subtype of [S1,  ..., Sn/T1,  ..., Tn]Bi,  1 <= i <= n,
 * In checked mode, it is a dynamic type error if a malformed type is used in a subtype test.
 * In production mode, an undeclared type is treated as an instance of type Dynamic.
 * @description Checks that it is a dynamic-type error if a malformed type is used in a
 * subtype test.
 * @dynamic-type-error
 * @static-warning
 * @author msyabro
 * @reviewer iefremov
 * @needsreview Issue 3282
 */

#import("../../Utils/dynamic_check.dart");

class C<T, U, V> {}
class Bounded<T extends num> {}
class BoundedInt<T extends int> {}
class NonGeneric{}

main() {
  checkTypeError( () {
    Expect.isTrue(null is MalformedType);
  });
  checkTypeError( () {
    Expect.isTrue(null is C<int>);
  });
  checkTypeError( () {
    Expect.isTrue(null is C<int, int, int, int>);
  });
  checkTypeError( () {
    Expect.isTrue(null is C <int, double, MalformedType>);
  });
  checkTypeError( () {
    Expect.isTrue(null is Bounded<String>);
  });
  checkTypeError( () {
    Expect.isTrue(null is BoundedInt<num>);
  });
  checkTypeError( () {
    Expect.isTrue(null is NonGeneric<String>);
  });
  checkTypeError( () {
    Expect.isTrue(null is C<C<int, int>, C, C>);
  });
  checkTypeError( () {
    Expect.isTrue(null is C<Bounded<String>, C, C>);
  });
  checkTypeError( () {
    Expect.isTrue(null is C<C<MalformedType>, C, C>);
  });
  checkTypeError( () {
    Expect.isTrue(null is C<NonGeneric<int>, C, C>);
  });
}

