/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description This tests the XMLHttpRequest responseXML attribute
 * value when given invalid XML data.
 */
import "dart:html";
import "../../testcommon.dart";

void main() {
    var xhr = new HttpRequest(),
        url = "$testSuiteRoot/fast/xmlhttprequest/resources/xmlhttprequest-get-invalid-data.xml";
        
    xhr.onLoad.listen((e) {
        Expect.equals(4, xhr.readyState);
        Expect.isNull(xhr.responseXml);
        asyncEnd();
    });
    
    xhr.onError.listen( (e) {
        asyncEnd();
        Expect.fail('The XHR request to an existing resource failed: $url');
    });

    asyncStart();
    xhr.open('GET', url);
    xhr.responseType = 'document';
    xhr.send(null);
}
