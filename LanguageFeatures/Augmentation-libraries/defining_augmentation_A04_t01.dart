// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// - An augmentation library contains any part directives.
///
/// @description Checks that it is a compile-time error if an augmentation
/// library contains any part directives.
/// @author sgrekhov22@gmail.com
/// @issue 55116

// SharedOptions=--enable-experiment=macros

part 'defining_augmentation_A04_t01_lib.dart';

main() {
}
