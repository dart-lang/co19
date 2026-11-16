// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// - The introductory declaration and augmenting declaration don't have the
///   same type parameters.
/// ...
/// When an augmentation must have the "same type parameters" as an
/// introductory declaration, that means:
/// - They must have the same number of type parameters (which may be zero).
/// - For each corresponding pair of type parameters:
///   - They must have the same name (same identifier).
///   - Their bounds must be the same type. This is after any omitted bound in
///     an introductory declaration has been given a default bound of `Object?`
///     and where any omitted bound in an augmentation has been inherited from
///     the introductory declaration.
///
/// @description Checks that it is not an error if an introductory type
/// declaration omits the bound of a type parameter and an augmenting type
/// declaration specifies the bound `Object?`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';

typedef NullableInt = int?;

class C<T> {}

augment class C<T extends Object?> {
  String get name => 'C<$T>';
}

mixin M<T> {}

augment mixin M<T extends Object?> {
  String get name => 'M<$T>';
}

enum E<T> {
  e0<NullableInt>();
}

augment enum E<T extends Object?> {
  ;
  String get name => 'E<$T>';
}

class A<T> {}

extension Ext<T> on A<T> {}

augment extension Ext<T extends Object?> {
  String get name => 'Ext<$T>';
}

extension type ET<T>(int _) {}

augment extension type ET<T extends Object?> {
  String get name => 'ET<$T>';
}

class MA<T> = Object with M<T>;

main() {
  Expect.equals('C<$NullableInt>', C<NullableInt>().name);
  Expect.equals('M<$NullableInt>', MA<NullableInt>().name);
  Expect.equals('E<$NullableInt>', E.e0.name);
  Expect.equals('Ext<$NullableInt>', A<NullableInt>().name);
  Expect.equals('ET<$NullableInt>', ET<NullableInt>(0).name);
}
