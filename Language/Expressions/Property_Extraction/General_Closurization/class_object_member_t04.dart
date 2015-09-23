/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if e is a prefix object and m refers
 * to a type or a member of class Object.
 * @description Check that it is a compile-time error if in expression e#m
 * e is a library prefix and m is Object's toString() method
 * @compile-error
 * @author sgrekhov@unipro.ru
 */
import 'method_lookup_lib.dart' as lib;

main() {
  lib#toString;
}
