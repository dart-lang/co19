// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if the referenced part declaration `p`
/// names a library other than the current library as the library to which `p`
/// belongs.
///
/// @description Checks that it is a compile error if the referenced part names
/// another library.
/// @author sgrekhov22@gmail.com

part "reference_t01_part.dart";
