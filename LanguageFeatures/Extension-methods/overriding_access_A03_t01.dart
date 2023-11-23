// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An equality check like [MyList(object) == x] is always disallowed
/// because an extension cannot declare a member named [==], and [MyList(object)
/// != x] is disallowed because it's also defined in terms of a member named
/// [==].
/// @description Check that it's not allowed to use [==] and [!=]construction for
/// the extensions.
/// @author iarkh@unipro.ru



extension MySimpleExt on String {
  bool get test => false;
  int getANum() => 12345;
  void tryme() {}
}

main() {
  bool res1 = MySimpleExt("testme") == true;
//            ^
// [cfe] Explicit extension application cannot be used as an expression.
//                                  ^^
// [analyzer] COMPILE_TIME_ERROR.UNDEFINED_EXTENSION_OPERATOR
  var  res2 = MySimpleExt("testme") == 14;
//            ^
// [cfe] Explicit extension application cannot be used as an expression.
//                                  ^^
// [analyzer] COMPILE_TIME_ERROR.UNDEFINED_EXTENSION_OPERATOR

  bool res3 = MySimpleExt("testme") != true;
//            ^
// [cfe] Explicit extension application cannot be used as an expression.
//                                  ^^
// [analyzer] COMPILE_TIME_ERROR.UNDEFINED_EXTENSION_OPERATOR
  var  res4 = MySimpleExt("testme") != 128;
//            ^
// [cfe] Explicit extension application cannot be used as an expression.
//                                  ^^
// [analyzer] COMPILE_TIME_ERROR.UNDEFINED_EXTENSION_OPERATOR
}
