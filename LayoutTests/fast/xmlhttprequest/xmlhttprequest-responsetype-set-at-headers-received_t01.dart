/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description This tests that the XMLHttpRequest responseType attribute is
 * modifiable in the HEADERS_RECEIVED state.
 */
import "dart:html";
import "../../testcommon.dart";

void main() {
    HttpRequest xhr = new HttpRequest();
    asyncStart();
    xhr.open('GET', window.location.href);
    xhr.onLoad.listen((e) {
        Expect.equals(xhr.response, xhr.responseXml, "response");
        Expect.equals('document', xhr.responseType, "responseType");
        asyncEnd();
    });
    xhr.onError.listen((e) {
        Expect.fail('An error occurred while loading the document ${window.location.href}.');
        asyncEnd();
    });
    xhr.onReadyStateChange.listen((e) {
        if (xhr.readyState == 2) {
            // HEADERS_RECEIVED state, set the responseType now
            xhr.responseType = 'document';
        } else if (xhr.readyState > 2) {
            // LOADING or DONE, so we should get an exception when trying to set responseType
            Expect.throws((){xhr.responseType = 'text';});
        }
    });
    xhr.send(null);
}