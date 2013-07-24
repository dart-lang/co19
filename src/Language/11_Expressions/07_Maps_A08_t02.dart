/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iff all the keys in a map literal are compile-time constants, it is 
 * a static warning if the values of any two keys in a map literal are equal. 
 * @description Checks that there is no static warning if the values of any two keys in 
 *  a map literal are equal, but they are not compile time constants.
 * @author hlodvig
 * @needsreview 11255
 */

class A{
  String v;
  A(String x){ v = x;}
  
  String get m => v;
}

main() {
  A key1 = new A("key");
  A key2 = new A("key");
  
  <String, int>{
    key1.m: 1,
    key2.m: 2 
  };
}
