/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Spawns new isolate
 * @description Checks that light and heavy isolates 
 * can be spawned simultaneously.
 * @author msyabro
 * @reviewer kaigorodov
 * @expected-output Ok
 */

class TestIsolate extends Isolate {
  TestIsolate.light(): super.light() {}
  TestIsolate.heavy(): super.heavy() {}
  
  void main() {
  }
}

void main() {
  TestIsolate light = new TestIsolate.light();
  TestIsolate heavy = new TestIsolate.heavy();
  void func1(SendPort p) {
    return heavy.spawn();
  } 
  void func3(var res) {
    	print ('Ok');
  }
  void func2(Promise hp) {
    hp.addCompleteHandler(func3);	
  }
  light.spawn().then(func1).addCompleteHandler(func2);
  
}