/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let K be a class declaration with the same constructors, superclass and in-
 * terfaces as C, and the instance members declared by M (respectively M 1 , . . . , M k ).
 * It is a static warning if the declaration of K would cause a static warning.
 * @description Checks that it is a static warning if S and Mi declare members with the same
 * names but conflicting types
 * @static-warning
 * @author sgrekhov@unipro.ru
 * @issue 23878
 */

class S {
  bool get g => false;
}

class M1 {
  int get g => 1;
}

class M2 {
  String get g => "";
}

class C = S with M1, M2;

main() {
}
