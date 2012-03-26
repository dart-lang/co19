/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Spawns a new isolate, using this instance as template.
 * @description Spawns many isolates.
 * @author msyabro
 * @reviewer kaigorodov
 * @expected-output message=0
 */

#import('dart:isolate');

class AddIsolate extends Isolate {
  AddIsolate(): super();
  
  void act(int message, SendPort replyTo) {
      message--;
      if(message > 0) {
        this.spawn().then((SendPort port) {
          port.send((message), replyTo);
        });
      } else {
        replyTo.send(message, null);
      }
  }
  
  void main() {
    port.receive(act);
  }
}

void callback(var message, SendPort replyTo) {
   print("message="+message); // expected-output
}
	 
void main() {
  int isolateCount=10;
  new AddIsolate().spawn().then(void func(SendPort port) {
     port.call(isolateCount).receive(callback);
  });
}
