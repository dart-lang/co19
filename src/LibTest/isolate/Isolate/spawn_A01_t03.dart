/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Spawns a new isolate, using this instance as template.
 * @description Checks that light and heavy isolates 
 * can be spawned simultaneously.
 * @author msyabro
 * @reviewer kaigorodov
 * @expected-output Ok
 */

#import('dart:isolate');

class TestIsolate extends Isolate {
  TestIsolate.light(): super.light() {}
  TestIsolate.heavy(): super.heavy() {}
  
  void main() {
  }
}

void main() {
  TestIsolate light = new TestIsolate.light();
  TestIsolate heavy = new TestIsolate.heavy();
  void func2(SendPort p) {
    print ('Ok');
  }
  void func1(SendPort p) {
    heavy.spawn().then(func2);
  } 

  light.spawn().then(func1);
  
}