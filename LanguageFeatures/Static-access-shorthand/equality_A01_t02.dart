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
/// `e1 != e2` and `e2` is a shorthand expression then it has shorthand
/// context from `e1`. Test a mixin.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=dot-shorthands

import '../../Utils/expect.dart';

class C<T> {
  String log = "";
  T value;
  C(this.value);

  @override
  bool operator ==(Object other) {
    log = "$this == $other";
    if (other is C) {
      return value == other.value;
    }
    return false;
  }

  @override
  String toString() => "${this.runtimeType}($value)";
}

mixin M<T> on C<T> {
  static M<int> get staticGetter => MC(1);
  static M<X> staticMethod<X>(X x) => MC<X>(x);
  static List<M<String>> instances = [MC("one")];
}

class MC<T> = C<T> with M<T>;

main() {
  M<int> m1 = MC(1);
  Expect.isTrue(m1 == .staticGetter);
  Expect.equals("MC<int>(1) == MC<int>(1)", m1.log);
  Expect.isFalse(m1 != .staticGetter);
  Expect.equals("MC<int>(1) == MC<int>(1)", m1.log);

  M<int> m2 = MC(2);
  Expect.isFalse(m2 == .staticMethod<String>("two"));
  Expect.equals("MC<int>(2) == MC<String>(two)", m2.log);
  Expect.isTrue(m2 != .staticMethod<String>("two"));
  Expect.equals("MC<int>(2) == MC<String>(two)", m2.log);

  M<String> m3 = MC("one");
  Expect.isTrue(m3 == .instances[0]);
  Expect.equals("MC<String>(one) == MC<String>(one)", m3.log);
  Expect.isFalse(m3 != .instances[0]);
  Expect.equals("MC<String>(one) == MC<String>(one)", m3.log);
}
