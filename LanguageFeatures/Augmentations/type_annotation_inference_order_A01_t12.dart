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
/// @description Checks that omitted bounds in the introductory declaration get
/// the default bound `Object?`, and are not inferred from an augmentation. Test
/// that it is a compile-time error if an augmentation specifies a different
/// bound.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

bar<T>(T t);
augment bar<T extends Object>(T t) => t;
//                    ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class C<T> {}

augment class C<T extends Object> {}
//                        ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin M<T> {}

augment mixin M<T extends Object> {}
//                        ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

enum E<T> {
  e0<int>();
}

augment enum E<T extends Object> {
//                       ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  ;
}

class A {}

extension Ext<T> on A {}

augment extension Ext<T extends Object> {}
//                              ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

extension type ET<T>(int _) {}

augment extension type ET<T extends Object> {}
//                                  ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(bar);
  print(C);
  print(M);
  print(E);
  print(A);
  print(ET);
}
