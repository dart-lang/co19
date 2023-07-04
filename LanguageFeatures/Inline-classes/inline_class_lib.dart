// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @description Helper library for testing inline classes
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

library inline_class_lib;

int x = 42;

final inline class FinalInlineClass {
  final int x;
  const FinalInlineClass([this.x = 0]);
}

inline class LibraryInlineClass {
  final int _x = 0;

  int get val => _x;
}
