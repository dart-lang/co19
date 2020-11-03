/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Like for a class or mixin member declaration, the names of the
 * extension members, both static and instance, are in the lexical scope of the
 * extension member body. That is why MySmart above can invoke the static
 * smartHelper without prefixing it by the extension name. In the same way,
 * instance member declarations (the extension members) are in the lexical scope
 *
 * @description Check that extension static member cannot access referred class
 * static member without prefix
 * @author sgrekhov@unipro.ru
 */


class C {
  static String cStaticMember = "Lily was here";
}

extension ExtendedC on C {
  static String st = cStaticMember;
  //                 ^^^^^^^^^^^^^
  // [analyzer] COMPILE_TIME_ERROR.UNQUALIFIED_REFERENCE_TO_STATIC_MEMBER_OF_EXTENDED_TYPE
  // [cfe] Getter not found: 'cStaticMember'.
  void test() {
    cStaticMember;
//  ^^^^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.UNQUALIFIED_REFERENCE_TO_STATIC_MEMBER_OF_EXTENDED_TYPE
// [cfe] The getter 'cStaticMember' isn't defined for the class 'C'.
  }
}

main() {
  C c = new C();
  c.test();
}
