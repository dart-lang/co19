// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Many combinations don't make sense:
/// ...
/// - mixin as a modifier can obviously only be applied to a class declaration,
///   which makes it also introduce a mixin declaration.
///
/// @description Check that `mixin class` can be mixed in
/// @author sgrekhov22@gmail.com

mixin class MixinClass {
  void fooMixin() {}
}

class C {}

class M1 = C with MixinClass;

class M2 with MixinClass {
}

main() {
  M1().fooMixin();
  M2().fooMixin();
}
