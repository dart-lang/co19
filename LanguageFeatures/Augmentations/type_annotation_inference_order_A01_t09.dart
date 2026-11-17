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
/// @description Checks that uninferred types in the introductory declaration
/// get the default type `dynamic` for type annotations, and that an
/// augmentation may either omit these types (and inherit them) or specify them
/// explicitly.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';

foo1(x);
augment foo1(x) {
  if (1 > 2) {
    x.checkDynamic;
  }
  return x + 1;
}

foo2(x);
augment dynamic foo2(dynamic x) => x + 1;

class C {
  foo1(x);
  foo2(x);
}

augment class C {
  augment foo1(x) {
    if (1 > 2) {
      x.checkDynamic;
    }
    return x + 1;
  }
  augment dynamic foo2(dynamic x) => x + 1;
}

mixin M {
  foo1(x);
  foo2(x);
}

augment mixin M {
  augment foo1(x) {
    if (1 > 2) {
      x.checkDynamic;
    }
    return x + 1;
  }
  augment dynamic foo2(dynamic x) => x + 1;
}

class MA = Object with M;

enum E {
  e0;
  foo1(x);
  foo2(x);
}

augment enum E {
  ;
  augment foo1(x) {
    if (1 > 2) {
      x.checkDynamic;
    }
    return x + 1;
  }
  augment dynamic foo2(dynamic x) => x + 1;
}

class A {}

extension Ext on A {
  foo1(x);
  foo2(x);
}

augment extension Ext {
  augment foo1(x) {
    if (1 > 2) {
      x.checkDynamic;
    }
    return x + 1;
  }
  augment dynamic foo2(dynamic x) => x + 1;
}

extension type ET(int _) {
  foo1(x);
  foo2(x);
}

augment extension type ET {
  augment foo1(x) {
    if (1 > 2) {
      x.checkDynamic;
    }
    return x + 1;
  }
  augment dynamic foo2(dynamic x) => x + 1;
}

main() {
  Expect.isTrue(foo1(1).isEven);
  Expect.isTrue(foo2(1).isEven);
  Expect.isTrue(C().foo1(1).isEven);
  Expect.isTrue(C().foo2(1).isEven);
  Expect.isTrue(MA().foo1(1).isEven);
  Expect.isTrue(MA().foo2(1).isEven);
  Expect.isTrue(E.e0.foo1(1).isEven);
  Expect.isTrue(E.e0.foo2(1).isEven);
  Expect.isTrue(A().foo1(1).isEven);
  Expect.isTrue(A().foo2(1).isEven);
  Expect.isTrue(ET(0).foo1(1).isEven);
  Expect.isTrue(ET(0).foo2(1).isEven);

  if (1 > 2) {
    foo1(1).checkDynamic;
    foo2(1).checkDynamic;
    C().foo1(1).checkDynamic;
    C().foo2(1).checkDynamic;
    MA().foo1(1).checkDynamic;
    MA().foo2(1).checkDynamic;
    E.e0.foo1(1).checkDynamic;
    E.e0.foo2(1).checkDynamic;
    A().foo1(1).checkDynamic;
    A().foo2(1).checkDynamic;
    ET(0).foo1(1).checkDynamic;
    ET(0).foo2(1).checkDynamic;
  }
}
