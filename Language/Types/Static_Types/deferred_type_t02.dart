/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A type T is deferred iff it is of the form p.T where p is a
 * deferred prefix. It is a static warning to use a deferred type in a type
 * annotation, type test, type cast or as a type parameter. However, all other
 * static warnings must be issued under the assumption that all deferred
 * libraries have successfully been loaded.
 * @description Checks that it is a static warning if a deferred type is used
 * in a type annotation, type test, type cast or as a type parameter.
 * @compile-error
 * @author ngl@unipro.ru
 */

import "../../../Utils/expect.dart";
import "../somelib1.dart" deferred as p1;

class C1<T> {}

main() {
 String is p1.C;
}
