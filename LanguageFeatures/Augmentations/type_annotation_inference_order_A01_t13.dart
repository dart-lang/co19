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
/// @description Checks that omitted bounds of type parameters of an augmenting
/// class, mixin, enum, extension or extension type declaration are inherited
/// from the introductory declaration.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';

class C<X extends num, Y extends X> {}

augment class C<X, Y> {
  bool isNeg(X x) => x.isNegative;
  X getX(Y y) => y;
}

mixin M<X extends num, Y extends X> {}

augment mixin M<X, Y> {
  bool isNeg(X x) => x.isNegative;
  X getX(Y y) => y;
}

class MA<X extends num, Y extends X> = Object with M<X, Y>;

enum E<X extends num, Y extends X> {
  e0<num, int>();
}

augment enum E<X, Y> {
  ;
  bool isNeg(X x) => x.isNegative;
  X getX(Y y) => y;
}

class A {}

extension Ext<X extends num, Y extends X> on A {}

augment extension Ext<X, Y> {
  bool isNeg(X x) => x.isNegative;
  X getX(Y y) => y;
}

extension type ET<X extends num, Y extends X>(int _) {}

augment extension type ET<X, Y> {
  bool isNeg(X x) => x.isNegative;
  X getX(Y y) => y;
}

main() {
  Expect.isTrue(C<num, int>().isNeg(-1));
  Expect.equals(1, C<num, int>().getX(1));

  Expect.isTrue(MA<num, int>().isNeg(-1));
  Expect.equals(1, MA<num, int>().getX(1));

  Expect.isTrue(E.e0.isNeg(-1));
  Expect.equals(1, E.e0.getX(1));

  Expect.isTrue(Ext<num, int>(A()).isNeg(-1));
  Expect.equals(1, Ext<num, int>(A()).getX(1));

  Expect.isTrue(ET<num, int>(0).isNeg(-1));
  Expect.equals(1, ET<num, int>(0).getX(1));
}
