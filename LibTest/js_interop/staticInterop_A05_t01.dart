// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion `staticInterop` enables the JS annotated class to be treated as
/// a "static" interop class.
///
/// These classes implicitly all erase to the internal interceptor
/// `JavaScriptObject`, so they can be freely casted to and from other
/// [staticInterop] types, `dart:html` types, and `JSObject` from
/// `dart:js_interop`. Non-[staticInterop] `package:js` types can be casted to
/// [staticInterop] types, but the reverse can fail if the underlying value is a
/// `@Native`-reserved type (like `dart:html` types).
///
/// [staticInterop] classes have the following restrictions:
///  - They must contain a [JS] annotation, either from this library or from
///    `dart:js_interop`.
///  - They should not contain any instance members, inherited or otherwise, and
///    should instead use static extension members, which can be external or
///    non-external.
///  - They can only contain factories and `static` members. They can be
///    combined with [anonymous] to make external factories create new
///    JavaScript object literals instead.
///  - They should not implement, extend, or mixin non-[staticInterop] classes
///    and vice-versa.
///  - The annotation should only be applied to non-mixin classes and no other
///    declarations.
///
/// @description Checks that it is a compile-time error if a mixin or mixin
/// class is annotated with `@staticInterop`.
/// @author sgrekhov22@gmail.com
/// @issue 61125

import 'dart:js_interop';

@staticInterop
@JS()
mixin M1 {}
//    ^^
// [analyzer] unspecified
// [web] unspecified

@staticInterop
@JS()
base mixin M2 {}
//         ^^
// [analyzer] unspecified
// [web] unspecified

@staticInterop
@JS()
mixin class M3 {}
//          ^^
// [analyzer] unspecified
// [web] unspecified

@staticInterop
@JS()
abstract mixin class M4 {}
//                   ^^
// [analyzer] unspecified
// [web] unspecified

@staticInterop
@JS()
base mixin class M5 {}
//               ^^
// [analyzer] unspecified
// [web] unspecified

@staticInterop
@JS()
abstract base mixin class M6 {}
//                        ^^
// [analyzer] unspecified
// [web] unspecified

main() {
  print(M1);
  print(M2);
  print(M3);
  print(M4);
  print(M5);
  print(M6);
}
