// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It’s a compile-time error if a part file is a sub-part of itself.
/// That is, if the includes relation has a cycle.
///
/// @description Check that it is a compile-time error if a part file is a
/// sub-part of itself.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enhanced-parts

part of 'terminology_A04_t01_part1.dart';

part 'terminology_A04_t01.dart';
//    ^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
