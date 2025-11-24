// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion At a high level, a non-redirecting generative constructor marked
/// `augment` may:
/// - Augment the constructor with an additional constructor body (bodies are
///   invoked in augmentation order, starting at the introductory declaration).
///
/// @description Checks that it is a compile-time error to augment a default
/// unnamed constructor (that doesn't exist during augmentation).
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part 'augmenting_constructors_A09_t03_lib.dart';

class C1 {}
class C2 {}

enum E1 {
  e0;
}
enum E2 {
  e0;
}

main() {
  print(C1);
  print(C2);
  print(E1);
  print(E2);
}
