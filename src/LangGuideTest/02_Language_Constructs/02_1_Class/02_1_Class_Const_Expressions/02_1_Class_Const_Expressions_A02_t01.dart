/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If a class has a constant constructor, all its fields must be marked as final.
 * @description Checks class with constant constructor and non-final field.
 * @author iefremov
 * @compile-error
 * @reviewer msyabro
 */

class C { 
  const C();
  int i;
}

main() {}
