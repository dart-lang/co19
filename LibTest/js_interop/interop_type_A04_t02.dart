// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion When interacting with a JS value, you need to provide a Dart type
/// for it. You can do this by either using or declaring an interop type.
/// Interop types are either a "JS type" provided by Dart or an extension type
/// wrapping an interop type.
///
/// @description Check that it is a compile-time error to tear-off an external
/// member of JS interop type. Test methods of an extension.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';

extension type ET._(JSObject _) implements JSObject {
  external ET.fromDart(num value);
}

extension Ext on ET {
  external int foo();
}

extension on ET {
  external void bar();
}

test(ET et) {
  et.foo;
//   ^^^
// [analyzer] unspecified
// [web] unspecified
  et.bar;
//   ^^^
// [analyzer] unspecified
// [web] unspecified
}

main() {
  print(test);
}
