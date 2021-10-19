// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion A class may be defined as a mixin application.
///
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
/// @description Checks that it is a compile error to derive a mixin from a
/// class which has a superclass other than Object, even if mixin has all of its
/// methods
/// @issue 26409
/// @issue 42254
/// @author sgrekhov@unipro.ru


class S {
  int m1() => 1;
}

class M extends S {
  int m2() => 2;
}

class A extends S {
  int m3() => 3;
}

class C = A with M;
//               ^
// [analyzer] unspecified
// [cfe] unspecified

main() {
   new C();
}
