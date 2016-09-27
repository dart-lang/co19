/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Dart supports two levels of privacy: public and private. 
 * A declaration is private iff its name is private, otherwise it is public.
 * A name q is private iff any one of the identifiers that comprise q is 
 * private, otherwise it is public.
 * An identifier is private iff it begins with an underscore (the _ character) 
 * otherwise it is public.
 * A declaration m is accessible to library L if m is declared in L or if m is 
 * public.
 * @description Checks that access to private instance class members
 * from a script that imports the library where the class is declared result 
 * in a compile error
 * @compile-error
 * @author iefremov
 * @reviewer rodionov
 */
import "../lib.dart";

main() {
  var c = new ClassWithPrivateMembers();
  c._fun();
}
