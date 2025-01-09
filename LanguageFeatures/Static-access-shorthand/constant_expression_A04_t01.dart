// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Given an expression that is a prefix of
/// `<staticMemberShorthandHead> <selector>*`, whose assigned shorthand context
/// denotes a declaration D, and where the identifier or `new` of the
/// `<staticMemberShorthandHead>` denotes a static declaration or constructor
/// declaration S when looked up on D.
/// ...
/// - An expression of the form `.new` which is not followed by the selectors or
///   an `<argumentPart>`, is a constant expression if S declares an unnamed
///   constructor, and either the target class is not generic, or type inference
///   has inferred constant type arguments for the target class.
///
/// @description Checks that an expression of the form `'.' <new>` which is
/// not followed by an `<argumentPart>` is a constant expression if `S` declares
/// an unnamed constructor and the target class is not generic.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enum-shorthands

import '../../Utils/expect.dart';

class C1 {
  @override
  bool operator ==(Object other) => identical(C1.new, other);
}

class C2 {
  C2();

  @override
  bool operator ==(Object other) => identical(C2.new, other);
}

class A1 {
  bool operator ==(Object other) => identical(ET1.new, other);
}

extension type ET1(A1 _) implements A1 {}

class A2 {
  bool operator ==(Object other) => identical(ET2.new, other);
}

extension type ET2.new(A2 _) implements A2 {}

main() {
  Expect.isTrue(C1() == .new);
  Expect.isTrue(C2() == .new);
  Expect.isTrue(ET1(A1()) == .new);
  Expect.isTrue(ET2(A2()) == .new);
}
