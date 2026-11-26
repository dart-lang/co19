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
/// the default bound `Object?`, and that an augmentation may either omit the
/// bound (and inherit it) or specify it explicitly. Test that if no type
/// argument is specified, the type parameter is instantiated to `dynamic` for
/// historical reasons.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';

Type bar1<T>();
augment Type bar1<T>() => T;

Type bar2<T>();
augment Type bar2<T extends Object?>() => T;

class C1<T> {}

augment class C1<T> {
  Type get typeT => T;
  T id(T t) => t;
}

class C2<T> {}

augment class C2<T extends Object?> {
  Type get typeT => T;
  T id(T t) => t;
}

mixin M1<T> {}

augment mixin M1<T> {
  Type get typeT => T;
  T id(T t) => t;
}

mixin M2<T> {}

augment mixin M2<T extends Object?> {
  Type get typeT => T;
  T id(T t) => t;
}

class MA1 = Object with M1;
class MA2 = Object with M2;

enum E1<T> {
  e0();
}

augment enum E1<T> {
  ;
  Type get typeT => T;
  T id(T t) => t;
}

enum E2<T> {
  e0();
}

augment enum E2<T extends Object?> {
  ;
  Type get typeT => T;
  T id(T t) => t;
}

class A {}

extension Ext1<T> on A {}

augment extension Ext1<T> {
  Type get typeT1 => T;
  T id1(T t) => t;
}

extension Ext2<T> on A {}

augment extension Ext2<T extends Object?> {
  Type get typeT2 => T;
  T id2(T t) => t;
}

extension type ET1<T>(int _) {}

augment extension type ET1<T> {
  Type get typeT => T;
  T id(T t) => t;
}

extension type ET2<T>(int _) {}

augment extension type ET2<T extends Object?> {
  Type get typeT => T;
  T id(T t) => t;
}

main() {
  Expect.equals(dynamic, bar1());
  Expect.equals(dynamic, bar2());
  Expect.equals(dynamic, C1().typeT);
  Expect.equals(dynamic, C2().typeT);
  Expect.equals(dynamic, MA1().typeT);
  Expect.equals(dynamic, MA2().typeT);
  Expect.equals(dynamic, E1.e0.typeT);
  Expect.equals(dynamic, E2.e0.typeT);
  Expect.equals(dynamic, Ext1(A()).typeT1);
  Expect.equals(dynamic, Ext2(A()).typeT2);
  Expect.equals(dynamic, ET1(0).typeT);
  Expect.equals(dynamic, ET2(0).typeT);

  if (1 > 2) {
    C1().id(1).checkDynamic;
    C2().id(1).checkDynamic;
    MA1().id(1).checkDynamic;
    MA2().id(1).checkDynamic;
    E1.e0.id(1).checkDynamic;
    E2.e0.id(1).checkDynamic;
    Ext1(A()).id1(1).checkDynamic;
    Ext2(A()).id2(1).checkDynamic;
    ET1(0).id(1).checkDynamic;
    ET2(0).id(1).checkDynamic;
  }
}
