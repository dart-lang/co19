// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// - The type parameters of the augmenting declaration do not match the
///   augmented declarations's type parameters. This means there must be the
///   same number of type parameters with the exact same type parameter names
///   (same identifiers) and bounds if any (same types, even if they may not be
///   written exactly the same in case one of the declarations needs to refer to
///   a type using an import prefix).
///
/// @description Checks that it is not an error if an augmenting type declares
/// the same number of type parameters with the same names and bounds.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part of 'augmenting_types_A05_t04.dart';

augment class C1<T extends A> {
  String get name1 => 'C1<$T>';
}
augment class C1<T extends AAlias> {
  String name2() => 'C1<$T>';
}
augment class C2<T extends A> {
  String get name1 => 'C2<$T>';
}
augment class C2<T extends AAlias> {
  String name2() => 'C2<$T>';
}

augment mixin M1<T extends A> {
  String get name1 => 'M1<$T>';
}
augment mixin M1<T extends AAlias> {
  String name2() => 'M1<$T>';
}
augment mixin M2<T extends A> {
  String get name1 => 'M2<$T>';
}
augment mixin M2<T extends AAlias> {
  String name2() => 'M2<$T>';
}

augment enum E1<T extends A> {
  augment e1<B>(),
  augment e2<AAlias>();
  String get name1 => 'E1<$T>';
}
augment enum E1<T extends AAlias> {
  augment e1<B>(),
  augment e2<AAlias>();

  String name2() => 'E1<$T>';
}
augment enum E2<T extends A> {
  augment e1<B>(),
  augment e2<AAlias>();
  String get name1 => 'E2<$T>';
}
augment enum E2<T extends AAlias> {
  augment e1<B>(),
  augment e2<AAlias>();
  String name2() => 'E2<$T>';
}

augment extension Ext1<T extends A> {
  String get name1 => 'Ext1<$T>';
}
augment extension Ext1<T extends AAlias> {
  String name2() => 'Ext1<$T>';
}
augment extension Ext2<T extends A> {
  String get name3 => 'Ext2<$T>';
}
augment extension Ext2<T extends AAlias> {
  String name4() => 'Ext2<$T>';
}

augment extension type ET1<T extends A> {
  String get name1 => 'ET1<$T>';
}
augment extension type ET1<T extends AAlias> {
  String name2() => 'ET1<$T>';
}
augment extension type ET2<T extends A> {
  String get name3 => 'ET2<$T>';
}
augment extension type ET2<T extends AAlias> {
  String name4() => 'ET2<$T>';
}
