// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
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
/// @description Checks that it is not an error if an augmenting type declares
/// the same number of type parameters with the same names and bounds. Test the
/// case when bound name has a library prefix.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,enhanced-parts

import '../../Utils/expect.dart';
import '../../Utils/static_type_helper.dart';
import 'augmentation_libraries_lib.dart';

part 'augmenting_class_like_declarations_A07_t02_lib.dart';

class C<T extends AL> {}

mixin M<T extends AL> {}

enum E<T extends AL> {
  e0;
}

class A{}
extension Ext<T extends AL> on A {}

extension type ET<T extends AL>(int _) {}

class MA<T extends AL> = Object with M<T>;

main() {
  C().expectStaticType<Exactly<C<AL>>>();
  MA().expectStaticType<Exactly<MA<AL>>>();
  E.e0.expectStaticType<Exactly<E<AL>>>();
  Expect.equals(AL, A().type);
  ET(0).expectStaticType<Exactly<ET<AL>>>();
}
