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

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';

class A {}
typedef AAlias = A;
class B extends A {}

class C1<T extends A> {}
class C2<T extends AAlias> {}

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

mixin M1<T extends A> {}
mixin M2<T extends AAlias> {}

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

enum E1<T extends A> {
  e1<B>(),
  e2<AAlias>();
}

enum E2<T extends AAlias>{
  e1<B>(),
  e2<AAlias>();
}

augment enum E1<T extends A> {
  ;
  String get name1 => 'E1<$T>';
}

augment enum E1<T extends AAlias> {
  ;
  String name2() => 'E1<$T>';
}

augment enum E2<T extends A> {
  ;
  String get name1 => 'E2<$T>';
}

augment enum E2<T extends AAlias> {
  ;
  String name2() => 'E2<$T>';
}

class D<T extends A> {}
extension Ext1<T extends A> on D<T> {}
extension Ext2<T extends AAlias> on D<T> {}

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

extension type ET1<T extends A>(int _) {}
extension type ET2<T extends AAlias>(int _) {}

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

class MA1<T extends A> = Object with M1<T>;
class MA2<T extends AAlias> = Object with M2<T>;

main() {
  Expect.equals("C1<B>", C1<B>().name1);
  Expect.equals("C1<B>", C1<B>().name2());
  Expect.equals("C1<A>", C1<AAlias>().name1);
  Expect.equals("C1<A>", C1<AAlias>().name2());
  Expect.equals("C2<B>", C2<B>().name1);
  Expect.equals("C2<B>", C2<B>().name2());
  Expect.equals("C2<A>", C2<AAlias>().name1);
  Expect.equals("C2<A>", C2<AAlias>().name2());

  Expect.equals("M1<B>", MA1<B>().name1);
  Expect.equals("M1<B>", MA1<B>().name2());
  Expect.equals("M1<A>", MA1<AAlias>().name1);
  Expect.equals("M1<A>", MA1<AAlias>().name2());
  Expect.equals("M2<B>", MA2<B>().name1);
  Expect.equals("M2<B>", MA2<B>().name2());
  Expect.equals("M2<A>", MA2<AAlias>().name1);
  Expect.equals("M2<A>", MA2<AAlias>().name2());

  Expect.equals("E1<B>", E1.e1.name1);
  Expect.equals("E1<B>", E1.e1.name2());
  Expect.equals("E1<A>", E1.e2.name1);
  Expect.equals("E1<A>", E1.e2.name2());
  Expect.equals("E2<B>", E2.e1.name1);
  Expect.equals("E2<B>", E2.e1.name2());
  Expect.equals("E2<A>", E2.e2.name1);
  Expect.equals("E2<A>", E2.e2.name2());

  Expect.equals("Ext1<B>", D<B>().name1);
  Expect.equals("Ext1<B>", D<B>().name2());
  Expect.equals("Ext1<A>", D<AAlias>().name1);
  Expect.equals("Ext1<A>", D<AAlias>().name2());
  Expect.equals("Ext2<B>", D<B>().name3);
  Expect.equals("Ext2<B>", D<B>().name4());
  Expect.equals("Ext2<A>", D<AAlias>().name3);
  Expect.equals("Ext2<A>", D<AAlias>().name4());

  Expect.equals("ET1<B>", ET1<B>(0).name1);
  Expect.equals("ET1<B>", ET1<B>(0).name2());
  Expect.equals("ET1<A>", ET1<AAlias>(0).name1);
  Expect.equals("ET1<A>", ET1<AAlias>(0).name2());
  Expect.equals("ET2<B>", ET2<B>(0).name3);
  Expect.equals("ET2<B>", ET2<B>(0).name4());
  Expect.equals("ET2<A>", ET2<AAlias>(0).name3);
  Expect.equals("ET2<A>", ET2<AAlias>(0).name4());
}
