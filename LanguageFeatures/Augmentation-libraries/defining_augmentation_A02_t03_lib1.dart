// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion With that feature, a part file can now have its own import and
/// export directives, and further nested part files, with part files inheriting
/// the imports and prefixes of their parent (part or library) file.
///
/// @description Checks that imports defined in a part are not visible in
/// another branch of a parts tree.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part of 'defining_augmentation_A02_t03.dart';

import 'augmentation_libraries_lib.dart';
