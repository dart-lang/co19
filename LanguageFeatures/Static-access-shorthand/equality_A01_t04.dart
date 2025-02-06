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
/// context from `e1`. Test an extension type.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=dot-shorthands

import '../../Utils/expect.dart';

extension type ET<T>(T value) {
  ET.id(this.value);
  factory ET.f(T t) = ET;

  static ET<int> get staticGetter => ET(1);
  static ET<X> staticMethod<X>(X x) => ET<X>(x);
  static List<ET<String>> instances = [ET("one")];
}

main() {
  Expect.isTrue(ET(1) == .staticGetter);
  Expect.isFalse(ET(1) != .staticGetter);

  Expect.isFalse(ET<int>(2) == .staticMethod<String>("two"));
  Expect.isTrue(ET<int>(2) != .staticMethod<String>("two"));

  Expect.isTrue(ET<String>("one") == .instances[0]);
  Expect.isFalse(ET<String>("one") != .instances[0]);

  Expect.isTrue(ET(4) == .new(4));
  Expect.isFalse(ET(4) != .new(4));

  Expect.isTrue(ET(5) == .id(5));
  Expect.isFalse(ET(5) != .id(5));

  Expect.isTrue(ET(6) == .f(6));
  Expect.isFalse(ET(6) != .f(6));
}
