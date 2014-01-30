/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final Stream<ProgressEvent> onLoad
 * Stream of load events handled by this HttpRequestEventTarget.
 * @description Checks the state of opened created request.
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  var request = new HttpRequest();
  request.open('GET', 'http://dartlang.org');
  request.onLoad.listen((event){
     Expect.fail('Request complete ${event.target.reponseText}');
     Expect.equals(HttpRequest.OPENED, request.readyState, "after listen");
   },
   onError:(Object error){
     Expect.fail("listen:onError($error)");
   },
   onDone:(Object error){
     Expect.fail("onDone");
   });
  request.send();
}
