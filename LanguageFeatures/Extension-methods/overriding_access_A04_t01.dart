// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An expression of the form [MyList(object)] or
/// [MyList<String>(object)] must only be used for extension member access. It is
/// a compile-time error to use it in any other way, similarly to how it is a
/// compile-time error to use a prefix for anything other than member access.
/// This also means that you cannot use an override expression as the receiver of
/// a cascade, because a cascade does evaluate its receiver to a value, or of an
/// assigning operator like += or ++. Unlike a prefix, it doesn't have to be
/// followed by a [.] because extensions can also declare operators, but it must
/// be followed by a [.], a declared operator, or an arguments part (in case the
/// extension implements call).
/// @description Check that overriding extensions can be used without member
/// access call.
/// @author iarkh@unipro.ru



import "extension_conflict_resolution_lib.dart" as testlib;

extension Ext1 on String {
  bool get test => false;
}

main() {
  testlib.MySimpleExt("testme");
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.EXTENSION_OVERRIDE_WITHOUT_ACCESS
//        ^
// [cfe] Explicit extension application cannot be used as an expression.
  Ext1("testme");
//^^^^^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.EXTENSION_OVERRIDE_WITHOUT_ACCESS
// [cfe] Explicit extension application cannot be used as an expression.

  testlib.MySimpleExt("testme")++;
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  Ext1("testme") += 14;
//^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  testlib.MySimpleExt("testme")--;
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  Ext1("testme") *= 10;
//^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  Ext1("testme") = 12;
//^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  testlib.MySimpleExt("testme") = -33;
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  Ext1("testme") = null;
//^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  testlib.MySimpleExt("testme") = null;
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
