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
/// @description Check that if `p` has type arguments `<K, V>`, then `p`s value
/// type is `V` and its key context is `K`
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";
import "../../Utils/static_type_helper.dart";

class A {}
class B extends A {}

class C<T extends A> {
  const C();
}

String test1() {
  String ret = "";
  switch ({const C<B>(): 1}) {
    case <C<B>, num>{const C(): var a}:
      a.expectStaticType<Exactly<num>>();
      a = 3.14;
      ret += "match;";
    default:
      ret += "no match;";
  }
  switch ({const C<A>(): 1}) {
    case <C<B>, num>{const C(): var a}:
      ret += "match;";
    default:
      ret += "no match;";
  }
  return ret;
}

String test2() {
  String ret = "";
  switch ({const C<B>(): 1}) {
    case <C<B>, num>{const C(): final a, ...}:
      a.expectStaticType<Exactly<num>>();
      ret += "match;";
    default:
      ret += "no match;";
  }
  switch ({const C<A>(): 1}) {
    case <C<B>, num>{const C(): final a, ...}:
      ret += "match;";
    default:
      ret += "no match;";
  }
  return ret;
}

String test3() {
  String ret = "";
  if ({const C<B>(): 1} case <C<B>, num>{const C(): var a}) {
    a.expectStaticType<Exactly<num>>();
    a = 3.14;
    ret += "match;";
  } else {
    ret += "no match;";
  }
  if ({const C<A>(): 1} case <C<B>, num>{const C(): var a}) {
    ret += "match;";
  } else {
    ret += "no match;";
  }
  return ret;
}

String test4() {
  String ret = "";
  if ({const C<B>(): 1} case <C<B>, num>{const C(): final a, ...}) {
    a.expectStaticType<Exactly<num>>();
    ret += "match;";
  } else {
    ret += "no match;";
  }
  if ({const C<A>(): 1} case <C<B>, num>{const C(): final a, ...}) {
    ret += "match;";
  } else {
    ret += "no match;";
  }
  return ret;
}

String test5() {
  String ret = switch ({const C<B>(): 1}) {
    <C<B>, num>{const C(): var a} when
        a.expectStaticType<Exactly<num>>() is num => "match;",
    _ => "no match;"
  };
  ret += switch ({const C<A>(): 1}) {
    <C<B>, num>{const C(): var a} when
        a.expectStaticType<Exactly<num>>() is num => "match;",
    _ => "no match;"
  };
  return ret;
}

String test6() {
  String ret = switch ({const C<B>(): 1}) {
    <C<B>, num>{const C(): final a, ...} when
      a.expectStaticType<Exactly<num>>() is num => "match;",
    _ => "no match;"
  };
  ret += switch ({const C<A>(): 1}) {
    <C<B>, num>{const C(): final a, ...} when
      a.expectStaticType<Exactly<num>>() is num => "match;",
    _ => "no match;"
  };
  return ret;
}

main() {
  var <C<B>, num>{const C(): var a1, ...} = {const C<B>(): 1};
  a1.expectStaticType<Exactly<num>>();
  a1 = 3.14;
  var <C<B>, num>{const C(): final a2, ...} = {const C<B>(): 1};
  a2.expectStaticType<Exactly<num>>();

  Expect.equals("match;no match;", test1());
  Expect.equals("match;no match;", test2());
  Expect.equals("match;no match;", test3());
  Expect.equals("match;no match;", test4());
  Expect.equals("match;no match;", test5());
  Expect.equals("match;no match;", test6());
}
