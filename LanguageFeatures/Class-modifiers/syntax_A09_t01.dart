// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Many combinations don't make sense:
/// ...
/// - A mixin declaration cannot be constructed, so abstract is redundant.
///
/// @description Check that it is a compile-time error if mixin declaration have
/// `abstract` modifier
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

  abstract mixin M1 {}
//^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(M1);
}
