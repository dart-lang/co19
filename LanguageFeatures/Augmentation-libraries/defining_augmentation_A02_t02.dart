// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion With that feature, a part file can now have its own import and
/// export directives, and further nested part files, with part files inheriting
/// the imports and prefixes of their parent (part or library) file.
///
/// @description Checks that imports in an augmentation library are not visible
/// in a main library even if an augmentation library exports it.
/// @author sgrekhov22@gmail.com
/// @issue 55112

// SharedOptions=--enable-experiment=macros

part 'defining_augmentation_A02_t02_lib.dart';

main() {
  print(AL);
//      ^^
// [analyzer] unspecified
// [cfe] unspecified
}
