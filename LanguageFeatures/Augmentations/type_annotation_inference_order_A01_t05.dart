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
/// @description Checks that an initializing formal in an augmenting constructor
/// inherits its type from the introductory declaration, not from the
/// corresponding field.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';
import '../../Utils/static_type_helper.dart';

class C1 {
  num x;
  C1(int x);
  C1.foo([int x = 0]);
  C1.bar({required int x});
}

augment class C1 {
  augment C1(this.x);
  augment C1.foo([this.x]);
  augment C1.bar({required this.x});
}

class C2 {
  C2(int x);
}

augment class C2 {
  num x;
  augment C2(this.x);
}

enum E {
  e0(1), e1.foo(), e2.bar(x: 2), e3.foo(3);

  final num x;
  const E(int x);
  const E.foo([int x = 0]);
  const E.bar({required int x});
}

augment enum E {
  ;
  augment const E(this.x);
  augment const E.foo([this.x]);
  augment const E.bar({required this.x});
}

main() {
  C1.new.expectStaticType<Exactly<C1 Function(int)>>();
  C1.foo.expectStaticType<Exactly<C1 Function([int])>>();
  C1.bar.expectStaticType<Exactly<C1 Function({required int x})>>();
  C2.new.expectStaticType<Exactly<C2 Function(int)>>();
  Expect.equals(1, C1(1).x);
  Expect.equals(0, C1.foo().x);
  Expect.equals(2, C1.bar(x: 2).x);
  Expect.equals(1, C2(1).x);
  Expect.equals(1, E.e0.x);
  Expect.equals(0, E.e1.x);
  Expect.equals(2, E.e2.x);
  Expect.equals(3, E.e3.x);
}
