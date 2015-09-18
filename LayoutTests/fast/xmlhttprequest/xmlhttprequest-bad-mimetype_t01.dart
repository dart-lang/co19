/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description This test checks for <a href="rdar://problem/5303567">&lt;rdar://problem/5303567&gt;</a>
 * REGRESSION: XMLHttpRequest.responseXML returns NULL if response MIME type is not XML -- breaks Wikipedia widget
 */
import "dart:html";
import "../../testcommon.dart";

HttpRequest sendRequest(url) {
    var request = new HttpRequest();
    request.open("GET", url, async:false);
    request.send(null);
    return request;
}

void test(String url) {
    var request = sendRequest(url);
    print("readyState: ${request.readyState}");
    print("responseText: ${request.responseText}");
    print("responseXML: ${request.responseXml}");
    print("status: ${request.status}");
    print("statusText: ${request.statusText}");
}

void main() {
  test("$testSuiteRoot/fast/xmlhttprequest/resources/plist.app");
}
