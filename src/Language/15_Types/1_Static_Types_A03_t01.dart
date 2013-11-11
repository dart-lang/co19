/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  A type T is malformed iff:
 * • T has the form id or the form prefix.id, and in the enclosing lexical scope,
 *   the name id (respectively prefix.id) does not denote a type.
 * • T denotes a type variable in the enclosing lexical scope, but occurs in the
 *   signature or body of a static member.
 * • T is a parameterized type of the form G<S1, ..., Sn>, and G is malformed.
 * • T denotes declarations that were imported from multiple imports clauses.
 * Any use of a malformed type gives rise to a static warning. A malformed
 * type is then interpreted as dynamic by the static type checker and the
 * runtime unless explicitly specified otherwise.
 * @description Checks that it is a dynamic type error if a malformed type is used in a
 * subtype test.
 * @static-warning
 * @author kaigorodov
 */

import "../../Utils/dynamic_check.dart";
import "../../Utils/expect.dart";

class C<T, U, V> {}
class Bounded<T extends num> {}
class BoundedInt<T extends int> {}

main() {
  Expect.throws(() => null is UnknownType); /// static type warning and run runtime error
      
  // C<int, double, UnknownType> is not malformed, see (Types/Parameterized Types)
  // UnknownType is treated as dynamic and parameterized type is C<int,double,dynamic>
  
  C<int, double, UnknownType> x = new C(); /// static type warning no such type
  Expect.isFalse(null is C<int, double, UnknownType>); /// static type warning no such type
  
  checkTypeError( () {
    Bounded<String> x2 = new Bounded(); /// static type warning malbounded
  });
    
  checkTypeError( () {
    BoundedInt<num> x3 = new BoundedInt(); /// static type warning malbounded
  });
  
  checkTypeError( () {
    C<Bounded<String>, C, C> x4 = new C(); /// static type warning malbounded
  });
  
  C<C<UnknownType, int, int>, C, C> x5 = new C(); /// static type warning no such type
}
