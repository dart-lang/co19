/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion class ArgumentError
 * Error thrown when a function is passed an unacceptable argument.
 * @description Checks that ArgumentError-specific methods work as specified.
 * @author sgrekhov@unipro.ru
 */
import "allTests.lib.dart";

ArgumentError create([value, String name, message]) =>
  new ArgumentError.value(value, name, message);

main() {
  test(create);  
}
