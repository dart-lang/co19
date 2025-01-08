// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Given an expression that is a prefix of
/// `<staticMemberShorthandHead> <selector>*`, whose assigned shorthand context
/// denotes a declaration D, and where the identifier or `new` of the
/// `<staticMemberShorthandHead>` denotes a static declaration or constructor
/// declaration S when looked up on D.
/// ...
/// - An expression of the form `.<identifier>` that is not followed by an
///   `<argumentPart>`, is a constant expression if S declares a static method
///   or constructor with base name `<identifier>`, and either type inference
///   has not added type arguments as a generic function instantiation coercion
///   to the method, or to the target class for a constructor, or the added type
///   arguments are constant types.
///
/// @description Checks that an expression of the form `'.'<identifier>` that is
/// not followed by an `<argumentPart>` is a constant expression if the
/// appropriate declaration declares a static method or constructor with base
/// name `<identifier>`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enum-shorthands

import '../../Utils/expect.dart';

class C1 {
  C1.id();

  @override
  bool operator ==(Object other) {
    return identical(C1.id, other);
  }
}

class C2 {
  static String foo() => "C2";

  @override
  bool operator ==(Object other) {
    if (other is Function) {
      Expect.equals("C2", other());
      return identical(C2.foo, other);
    }
    return false;
  }
}

mixin M {
  static String foo() => "M";

  @override
  bool operator ==(Object other) {
    if (other is Function) {
      Expect.equals("M", other());
      return identical(M.foo, other);
    }
    return false;
  }
}
class MA = Object with M;

main() {
  Expect.isTrue(C1.id() == .id);
  Expect.isTrue(C2() == .foo);
  Expect.isTrue((MA() as M) == .foo);
}
