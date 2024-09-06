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
/// the same number of type parameters with the same names and bounds. Test the
/// case when bound name has a library prefix.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import 'augmentation_libraries_lib.dart';
import '../../Utils/expect.dart';
import '../../Utils/static_type_helper.dart';
part 'augmenting_types_A05_t05_lib.dart';

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
