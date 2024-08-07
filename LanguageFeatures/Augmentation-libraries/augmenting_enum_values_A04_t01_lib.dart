// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Augmenting an existing enum value never changes the order in
/// which it appears in `values`.
///
/// @description Checks that an augmenting of an existing enum value never
/// changes the order in which it appears in `values`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmenting_enum_values_A04_t01.dart';

augment enum E {
  augment e3,
  augment e2,
  augment e1,
  augment e0;
}
