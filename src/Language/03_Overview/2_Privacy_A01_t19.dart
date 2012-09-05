/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Dart supports two levels of privacy: public and private.
 * A declaration is private iff its name begins with an underscore (the _ character)
 * otherwise it is public.
 * A declaration m is accessible to library L if m is declared in L or if m is public.
 * @description Checks that a compile-time error is produced when trying to access a private named
 * constructor that is not accessible to the current script.
 * @compile-error
 * @static-warning
 * @author iefremov
 * @reviewer rodionov
 */

import "lib.dart";

main() {
  try {
    new ClassWithPrivateMembers._named();
  } catch(x) {}
}
