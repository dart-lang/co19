// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If an expression has the form `e1 == e2` or `e1 != e2`, or a
/// pattern has the form `== e2` or `!= e2`, where the static type of `e1`, or
/// the matched value type of the pattern, is S1, and e2 is precisely a
/// `<staticMemberShorthand>` expression, then assign the type S1 as the
/// shorthand context of the `<staticMemberShorthandHead>` of e2 before
/// inferring its static type the same way as above.
///
/// @description Checks that if an expression has the form `e1 == e2` or
/// `e1 != e2` and `e2` is a shorthand expression, then it has context type from
/// `e1`. Test a class.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enum-shorthands

import '../../Utils/expect.dart';

class C<T> {
  String log = "";
  T value;
  C(this.value);
  C.id(this.value);
  factory C.f(T t) = C;

  static C<int> get staticGetter => C(1);
  static C<X> staticMethod<X>(X x) => C<X>(x);
  static List<C<String>> instances = [C("one")];

  @override
  bool operator ==(Object other) {
    log = "$this == $other";
    if (other is C) {
      return value == other.value;
    }
    return false;
  }

  @override
  String toString() => "C<$T>($value)";
}

main() {
  C<int> c1 = C(1);
  Expect.isTrue(c1 == .staticGetter);
  Expect.equals("C<int>(1) == C<int>(1)", c1.log);
  Expect.isFalse(c1 != .staticGetter);
  Expect.equals("C<int>(1) == C<int>(1)", c1.log);

  C<int> c2 = C(2);
  Expect.isFalse(c2 == .staticMethod<String>("two"));
  Expect.equals("C<int>(2) == C<String>(two)", c2.log);
  Expect.isTrue(c2 != .staticMethod<String>("two"));
  Expect.equals("C<int>(2) == C<String>(two)", c2.log);

  C<String> c3 = C("one");
  Expect.isTrue(c3 == .instances[0]);
  Expect.equals("C<String>(one) == C<String>(one)", c3.log);
  Expect.isFalse(c3 != .instances[0]);
  Expect.equals("C<String>(one) == C<String>(one)", c3.log);

  C<int> c4 = C(4);
  Expect.isTrue(c4 == .new(4));
  Expect.equals("C<int>(4) == C<int>(4)", c4.log);
  Expect.isFalse(c4 != .new(4));
  Expect.equals("C<int>(4) == C<int>(4)", c4.log);

  C<int> c5 = C(5);
  Expect.isTrue(c5 == .id(5));
  Expect.equals("C<int>(5) == C<int>(5)", c5.log);
  Expect.isFalse(c5 != .id(5));
  Expect.equals("C<int>(5) == C<int>(5)", c5.log);

  C<int> c6 = C(6);
  Expect.isTrue(c6 == .f(6));
  Expect.equals("C<int>(6) == C<int>(6)", c6.log);
  Expect.isFalse(c6 != .f(6));
  Expect.equals("C<int>(6) == C<int>(6)", c6.log);
}
