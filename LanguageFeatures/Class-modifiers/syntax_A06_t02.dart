// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Many combinations don't make sense:
/// ...
/// - mixin as a modifier can obviously only be applied to a class declaration,
///   which makes it also introduce a mixin declaration.
///
/// @description Check that it is a compile-time error if `mixin class` extends
/// class other than Object
/// @author sgrekhov22@gmail.com

class C {}

mixin class MixinClass extends C {
//                             ^
// [analyzer] unspecified
// [cfe] unspecified
  void fooMixin() {}
}

main() {
  print(MixinClass);
}
