// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// To type check a pattern p being matched against a value of type M:
/// ...
/// Map:
/// i. Calculate the value's entry key type K and value type V, and key context
///     C:
///   a. If p has type arguments <K, V> for some K and V then use those, and C
///     is K.
///   b. Else if M implements Map<K, V> for some K and V then use those, and C
///     is K.
///   c. Else if M is dynamic then K and V are dynamic and C is _.
///   d. Else K and V are Object? and C is _.
/// ii. Type-check each key expression using C as the context type.
/// iii. Type-check each value subpattern using V as the matched value type.
/// vi. The required type of p is Map<K, V>.
///
/// @description Check that if p has a type arguments <K1, V1> and M implements
/// Map<K2, V2> then value's value type is V1 and key context is K1
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";
import "../../Utils/static_type_helper.dart";

class A {}
class B extends A {}

class C<T> {
  const C();
}

class D<X> extends C<X> {
  const D();
}

String test1() {
  switch (<D<B>, int>{const D<B>(): 1} as Object) {
    case <C<B>, num>{const D(): var a}:
      a.expectStaticType<Exactly<num>>();
      a = 3.14;
      return "match";
    default:
      return "no match";
  }
}

String test2() {
  switch (<D<B>, int>{const D<B>(): 1} as Object) {
    case <C<B>, num>{const D(): final a}:
      a.expectStaticType<Exactly<num>>();
      return "match";
    default:
      return "no match";
  }
}

String test3() {
  if (<D<B>, int>{const D<B>(): 1} as Object
      case <C<B>, num>{const D(): var a}) {
    a.expectStaticType<Exactly<num>>();
    a = 3.14;
    return "match";
  }
  return "no match";
}

String test4() {
  if (<D<B>, int>{const D<B>(): 1} as Object
      case <C<B>, num>{const D(): final a}) {
    a.expectStaticType<Exactly<num>>();
    return "match";
  }
  return "no match";
}

String test5() =>
  switch (<D<B>, int>{const D<B>(): 1} as Object) {
    <C<B>, num>{const D(): var a} when
        a.expectStaticType<Exactly<num>>() is num => "match",
    _ => "no match"
  };

String test6() =>
  switch (<D<B>, int>{const D<B>(): 1} as Object) {
    <C<B>, num>{const D(): final a} when
        a.expectStaticType<Exactly<num>>() is num => "match",
    _ => "no match"
  };

main() {
  var <C<B>, num>{const D(): a1} = <D<B>, int>{const D<B>(): 1};
  a1.expectStaticType<Exactly<num>>();
  a1 = 3.14;
  final <C<B>, num>{const D(): a2}  = <D<B>, int>{const D<B>(): 1};
  a2.expectStaticType<Exactly<num>>();

  Expect.equals("match", test1());
  Expect.equals("match", test2());
  Expect.equals("match", test3());
  Expect.equals("match", test4());
  Expect.equals("match", test5());
  Expect.equals("match", test6());
}
