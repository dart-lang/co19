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
/// get the default type `dynamic` for type annotations, and are not inferred
/// from an augmentation. Test that it is a compile-time error if an
/// augmentation specifies a different type.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

foo1(x);
augment int foo1(x) => 1;
//      ^^^
// [analyzer] unspecified
// [cfe] unspecified

foo2(x);
augment foo2(int x) => x;
//           ^^^
// [analyzer] unspecified
// [cfe] unspecified

class C {
  foo1(x);
  foo2(x);
}

augment class C {
  augment int foo1(x) => 1;
//        ^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment foo2(int x) => x;
//             ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M {
  foo1(x);
  foo2(x);
}

augment mixin M {
  augment int foo1(x) => 1;
//        ^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment foo2(int x) => x;
//             ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e0;
  foo1(x);
  foo2(x);
}

augment enum E {
  ;
  augment int foo1(x) => 1;
//        ^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment foo2(int x) => x;
//             ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class A {}

extension Ext on A {
  foo1(x);
  foo2(x);
}

augment extension Ext {
  augment int foo1(x) => 1;
//        ^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment foo2(int x) => x;
//             ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int _) {
  foo1(x);
  foo2(x);
}

augment extension type ET {
  augment int foo1(x) => 1;
//        ^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment foo2(int x) => x;
//             ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(foo1);
  print(foo2);
  print(C);
  print(M);
  print(E);
  print(A);
  print(ET);
}
