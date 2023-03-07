// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// classDefinition:
///   metadata abstract? class mixinApplicationClass
/// ;
/// mixinApplicationClass:
///   identifier typeParameters? `=' mixinApplication `;'
///
/// mixinApplication:
///   type mixins interfaces?
/// ;
///
/// A mixin application of the form S with M; defines a class C with superclass
/// S.
/// A mixin application of the form S with M1,...,Mk; defines a class C whose
/// superclass is the application of the mixin composition Mk−1∗...∗M1 to S.
/// In both cases above, C declares the same instance members as M (respectively,
/// Mk).
/// @description Checks that it is no compile error if mixin references members
/// of 'Object' via 'super'
/// @issue 26409
/// @issue 42255
/// @author sgrekhov@unipro.ru

// TODO(https://github.com/dart-lang/sdk/issues/51557): Decide if the mixins
// being applied in this test should be "mixin", "mixin class" or the test
// should be left at 2.19.
// @dart=2.19

import '../../../Utils/expect.dart';

class A {
}

class M {
  String m() {
    return super.toString();
  }
}

class C = A with M;

main() {
  C c = new C();
  Expect.isNotNull(c.m());
}
