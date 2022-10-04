// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion It's not an error to override default value
/// See https://github.com/dart-lang/sdk/issues/49112
///
/// @description Checks that it is not an error if default value is overridden
///
/// @issue 27476
/// @author msyabro

class A {
  foo([x = 1]) {}
}

class C extends A {
  foo([x = '']);
}

main() {
  new C().foo();
}
