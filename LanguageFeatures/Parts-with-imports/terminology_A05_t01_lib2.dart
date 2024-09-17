// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A Dart file is either a library file or a part file, each having
/// its own grammar.
///
/// @description Checks that it is a compile-time error if an `import` directive
/// refers to a Dart file which is not a library.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part 'terminology_A05_t01_lib1.dart';
