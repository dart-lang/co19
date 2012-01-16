/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if any default values are specified in the signature
 * of an interface method, getter, setter or constructor.
 * @description Checks that it is a compile-time error if any default values are specified 
 * in the signature of an interface setter.
 * @compile-error
 * @author vasya
 * @reviewer rodionov
 */

interface I {
  set setter([var value = 1]);
}

main() {
  I i = null;
  
  try {
    i.setter = 0;
  } catch (NullPointerException e) {}
}

