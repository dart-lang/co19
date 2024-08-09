// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// An `external` variable is augmented with an abstract variable.
///
/// @description Checks that that it is a compile-time error if an `external`
/// variable is augmented with an abstract variable.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmenting_members_A10_t01.dart';

augment abstract class C {
  augment abstract String externalVariable;
//        ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
