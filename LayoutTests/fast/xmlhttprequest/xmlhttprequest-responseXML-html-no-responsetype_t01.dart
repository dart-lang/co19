/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description This tests the XMLHttpRequest responseXML loading an HTML document
 * with no specified responseType.
 */
import "dart:html";
import "../../testcommon.dart";

const String htmlEL = r'''
    <div id="description"></div>
    <div id="console"></div>
''';

void main() {
    document.body.appendHtml(htmlEL, treeSanitizer: NodeTreeSanitizer.trusted);
    HttpRequest xhr = new HttpRequest();
    String url = window.location.href;
    xhr.onLoad.listen((e) {
        Expect.isNull(xhr.responseXml);
        asyncEnd();
        });
    xhr.onError.listen( (e) {
        asyncEnd();
        Expect.fail('The XHR request to an existing resource failed: $url');
    });
    xhr.open('GET', url);
    xhr.send(null);
    asyncStart();
}