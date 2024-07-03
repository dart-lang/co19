// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A non-augmenting declaration must appear first before it can be
/// augmented.
///
/// @description Checks the merge order of augment libraries
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmenting_declarations_A02_t02_lib1.dart';

class C {}
