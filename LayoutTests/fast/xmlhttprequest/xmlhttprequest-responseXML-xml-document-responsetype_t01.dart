/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description This tests the XMLHttpRequest responseXml loading an XML document
 * with responseType "document".
 */
import "dart:html";
import "../../testcommon.dart";

void main() {
    var xhr = new HttpRequest(),
        url = "$testSuiteRoot/fast/xmlhttprequest/resources/xmlhttprequest-get-data.xml",
        id3;
        
    xhr.onLoad.listen((e) {
        Expect.isNotNull(xhr.responseXml);
        Expect.isTrue(xhr.responseXml is Document);
        id3 = xhr.responseXml.getElementById('id3');
        Expect.isNotNull(id3);
        Expect.equals('Three', id3.text);
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
