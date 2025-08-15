// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion When interacting with a JS value, you need to provide a Dart type
/// for it. You can do this by either using or declaring an interop type.
/// Interop types are either a "JS type" provided by Dart or an extension type
/// wrapping an interop type.
///
/// @description Check that it is a compile-time error to declare an external
/// constructor on JS interop extension type whose representation type of is not
/// subtype of [JSObject]. Test [JSAny].
/// @author sgrekhov22@gmail.com
/// @issue 61314

import 'dart:js_interop';

extension type MyAny1._(JSAny _) implements JSAny {
  external MyAny1.fromDart(String value);
//^
// [analyzer] unspecified
// [web] unspecified
}

@JS('Number')
extension type MyAny2._(JSAny _) implements JSAny {
  external MyAny2(num value);
//^
// [analyzer] unspecified
// [web] unspecified
}

main() {
  print(MyAny1);
  print(MyAny2);
}
