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
/// case when the bound name has a library prefix.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import 'augmentation_libraries_lib.dart' as p;
augment library 'augmenting_types_A05_t05.dart';

augment class C<T extends p.AL> {}

augment mixin M<T extends p.AL> {}

augment enum E<T extends p.AL> {
  augment e0;
}

augment extension Ext<T extends p.AL> {
  Type get type => T;
}

augment extension type ET<T extends p.AL>(int _) {}
