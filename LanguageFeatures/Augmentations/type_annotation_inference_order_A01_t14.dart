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
/// function or method declaration are inherited from the introductory
/// declaration.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';

bool topLevelFunction<X extends num, Y extends X>(X x, Y y);

augment bool topLevelFunction<X, Y>(X x, Y y) {
  X v = y;
  return x.isNegative && v.isNegative;
}

class C {
  static bool staticMethod<X extends num, Y extends X>(X x, Y y);
  bool instanceMethod<X extends num, Y extends X>(X x, Y y);
}

augment class C {
  augment static bool staticMethod<X, Y>(X x, Y y) {
    X v = y;
    return x.isNegative && v.isNegative;
  }
  augment bool instanceMethod<X, Y>(X x, Y y) {
    X v = y;
    return x.isNegative && v.isNegative;
  }
}

mixin M {
  static bool staticMethod<X extends num, Y extends X>(X x, Y y);
  bool instanceMethod<X extends num, Y extends X>(X x, Y y);
}

augment mixin M {
  augment static bool staticMethod<X, Y>(X x, Y y) {
    X v = y;
    return x.isNegative && v.isNegative;
  }
  augment bool instanceMethod<X, Y>(X x, Y y) {
    X v = y;
    return x.isNegative && v.isNegative;
  }
}

class MA = Object with M;

enum E {
  e0;
  static bool staticMethod<X extends num, Y extends X>(X x, Y y);
  bool instanceMethod<X extends num, Y extends X>(X x, Y y);
}

augment enum E {
  ;
  augment static bool staticMethod<X, Y>(X x, Y y) {
    X v = y;
    return x.isNegative && v.isNegative;
  }
  augment bool instanceMethod<X, Y>(X x, Y y) {
    X v = y;
    return x.isNegative && v.isNegative;
  }
}

class A {}

extension Ext on A {
  static bool staticMethod<X extends num, Y extends X>(X x, Y y);
  bool instanceMethod<X extends num, Y extends X>(X x, Y y);
}

augment extension Ext {
  augment static bool staticMethod<X, Y>(X x, Y y) {
    X v = y;
    return x.isNegative && v.isNegative;
  }
  augment bool instanceMethod<X, Y>(X x, Y y) {
    X v = y;
    return x.isNegative && v.isNegative;
  }
}

extension type ET(int _) {
  static bool staticMethod<X extends num, Y extends X>(X x, Y y);
  bool instanceMethod<X extends num, Y extends X>(X x, Y y);
}

augment extension type ET {
  augment static bool staticMethod<X, Y>(X x, Y y) {
    X v = y;
    return x.isNegative && v.isNegative;
  }
  augment bool instanceMethod<X, Y>(X x, Y y) {
    X v = y;
    return x.isNegative && v.isNegative;
  }
}

main() {
  Expect.isTrue(topLevelFunction<num, int>(-1, -2));
  Expect.isTrue(C.staticMethod<num, int>(-1, -2));
  Expect.isTrue(C().instanceMethod<num, int>(-1, -2));
  Expect.isTrue(M.staticMethod<num, int>(-1, -2));
  Expect.isTrue(MA().instanceMethod<num, int>(-1, -2));
  Expect.isTrue(E.staticMethod<num, int>(-1, -2));
  Expect.isTrue(E.e0.instanceMethod<num, int>(-1, -2));
  Expect.isTrue(Ext.staticMethod<num, int>(-1, -2));
  Expect.isTrue(A().instanceMethod<num, int>(-1, -2));
  Expect.isTrue(ET.staticMethod<num, int>(-1, -2));
  Expect.isTrue(ET(0).instanceMethod<num, int>(-1, -2));
}
