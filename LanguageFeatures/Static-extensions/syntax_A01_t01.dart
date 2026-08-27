// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is no longer an error to declare a factory constructor,
/// redirecting or not, or a redirecting generative constructor in an extension
/// declaration that has an on-declaration (defined later in this section), and
/// both kinds can be constant or not.
/// ...
/// For the purpose of identifying the on-declaration of a given extension, the
/// types `void`, `dynamic`, and `Never` are not considered to be classes, and
/// neither are record types or function types.
///
/// @description Checks that that it is a compile-time error to declare a
/// factory constructor in an extension declaration that has no on-declaration.
/// Test extension on type `void`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

class C {}

typedef Void = void;

extension Ext on void {
  factory Void.foo() => 42;
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  factory Void.bar() = C.new;
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
}
