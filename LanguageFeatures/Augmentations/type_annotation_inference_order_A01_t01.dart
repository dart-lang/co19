// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion In both the introductory declaration and augmentations, type
/// annotations and bounds may sometimes be omitted and are filled in
/// automatically by the compiler through various mechanisms. The compiler must
/// also check that an augmentation and introductory declaration have the same
/// type. And variable initializers need a downwards inference context type.
///
/// Those steps are ordered like so:
/// 1. Augmentations are applied. A declaration doesn't have meaningful type
///    system semantics until after augmentations are merged.
/// 2. Type inference fills in any omitted types in the introductory
///    declaration. This may come from override inference, inferring an
///    initializing formal from the corresponding field type, etc. Downwards and
///    upwards inference is applied to a variable declaration's type and
///    initializer. Any other uninferred types get a default type like `dynamic`
///    for type annotations or `Object?` for bounds.
/// 3. Omitted types and bounds in augmenting declarations are inherited from
///    the introductory declaration. Since an augmentation declaration must have
///    types in all of the same places as the introductory declaration, type
///    inheritance from the introductory declaration is sufficient to fill in
///    all omitted types. Downwards inference is applied to a variable
///    declaration's initializer.
/// 4. Augmentations are checked for "same type" conformance against the
///    introductory declaration.
///
/// @description Checks that augmentations are applied before type inference of
/// the introductory declaration. Test that override inference in the
/// introductory declaration uses a superinterface added by an `implements`
/// clause of an augmentation.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';
import '../../Utils/static_type_helper.dart';

abstract class A {
  double get x;
  num foo(int v);
}

class C {
  final x = 12;
  foo(v) => v;
}

augment class C implements A {}

mixin M {
  final x = 12;
  foo(v) => v;
}

augment mixin M implements A {}

class MA = Object with M;

enum E {
  e0;
  final x = 12;
  foo(v) => v;
}

augment enum E implements A {
  ;
}

main() {
  C().x.expectStaticType<Exactly<double>>();
  C().foo.expectStaticType<Exactly<num Function(int)>>();
  Expect.equals(12.0, C().x);
  Expect.equals(1, C().foo(1));

  MA().x.expectStaticType<Exactly<double>>();
  MA().foo.expectStaticType<Exactly<num Function(int)>>();
  Expect.equals(12.0, MA().x);
  Expect.equals(1, MA().foo(1));

  E.e0.x.expectStaticType<Exactly<double>>();
  E.e0.foo.expectStaticType<Exactly<num Function(int)>>();
  Expect.equals(12.0, E.e0.x);
  Expect.equals(1, E.e0.foo(1));
}
