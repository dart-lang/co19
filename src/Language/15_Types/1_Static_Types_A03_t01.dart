/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  A type T is malformed iff:
 * • T has the form id or the form pref ix.id, and in the enclosing lexical scope,
 *   the name id (respectively pref ix.id) does not denote a type.
 * • T denotes a type variable in the enclosing lexical scope, but occurs in the
 *   signature or body of a static member.
 * • T is a parameterized type of the form G<S1, ..., Sn>, and G is malformed.
 * Any use of a malformed type gives rise to a static warning. A malformed
 * type is then interpreted as dynamic by the static type checker and the runtime.
 * @description Checks that it is a dynamic type error if a malformed type is used in a
 * subtype test.
 * @static-warning
 * @author kaigorodov
 * @issue 5809
 */

import "../../Utils/dynamic_check.dart";
import "../../Utils/expect.dart";

class C<T, U, V> {}
class Bounded<T extends num> {}
class BoundedInt<T extends int> {}

main() {
  null is UnknownType; /// static type warning but not a runtime error
      
  C<int, double, UnknownType> x = new C(); /// static type warning no such type
  
  // since null is not dynamic
  Expect.isFalse(null is C<int, double, UnknownType>); /// static type warning no such type
  
  C<int, double, UnknownType> x1 = new C(); /// static type warning no such type
  
  checkTypeError( () {
    Bounded<String> x2 = new Bounded(); /// static type warning not assignable 
  });
    
  checkTypeError( () {
    BoundedInt<num> x3 = new BoundedInt();
  });
  
  C<Bounded<String>, C, C> x4 = new C();
  
  C<C<UnknownType, int, int>, C, C> x5 = new C(); /// static type warning no such type
}
