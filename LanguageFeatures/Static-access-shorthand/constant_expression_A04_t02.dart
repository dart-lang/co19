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
/// @description Checks that an expression of the form `'.'<new>` which is
/// not followed by an `<argumentPart>` is a constant expression if `S` declares
/// an unnamed constructor and the type inference has inferred constant type
/// arguments for the target class
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enum-shorthands

import '../../Utils/expect.dart';

class C<T> {
  T t;
  C(this.t);

  @override
  bool operator ==(Object other) {
    return identical(C<int>.new, other);
  }
}

main() {
  Expect.isTrue(C(1) == .new);
}
