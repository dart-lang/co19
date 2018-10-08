/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description Tests aborting XMLHttpRequest 'arraybuffer' loading with the .responseType and .response attributes.
 */
import "dart:html";
import "../../testcommon.dart";

HttpRequest xhr;

void abort(e) {
    print("abort() 1");
    asyncEnd();
    print("abort() 2");
    // For aborted 'arraybuffer' the .response should not yet exist.
    var response;
    try {
       response=xhr.response;
    } catch (e) {
      print("exc: $e");
    }
    Expect.isNull(response, "'arraybuffer' .response should not exist after aborted load.");
    print("abort() 3");
    xhr = null;
    print("abort() 4");
}

void load(e) {
   //print("load()");
    Expect.fail("onload() should not be called since loading was aborted.");
}

void main() {
    xhr = new HttpRequest();
    xhr.onLoad.listen(load);
    xhr.onAbort.listen(abort);
    asyncStart();
    xhr.open("GET", "$testSuiteRoot/fast/xmlhttprequest/resources/balls-of-the-orient.aif", async:true);
    xhr.responseType = "arraybuffer";
    Expect.equals("arraybuffer", xhr.responseType, "xhr.responseType was not set to 'arraybuffer'.");

    xhr.send(null);
    xhr.abort();
}
