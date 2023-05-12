// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Many combinations don't make sense:
/// ...
/// - sealed types cannot be constructed so it's redundant to combine with
///   abstract.
///
/// @description Check that it is a compile time error to
/// `abstract sealed class`
/// @author sgrekhov22@gmail.com

  abstract sealed class AbstractSealed {}
//         ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  sealed abstract class SealedAbstract {}
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(AbstractSealed);
  print(SealedAbstract);
}
