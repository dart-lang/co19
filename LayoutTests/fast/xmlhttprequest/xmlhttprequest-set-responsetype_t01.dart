/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description This test checks if setting non-supported type does not throw an exception.
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../../testcommon.dart";

void main() {
    var xhr = new HttpRequest(),
        url = "$testSuiteRoot/fast/xmlhttprequest/resources/plist.app";

    xhr.open('GET', url, async:true);

// Setting valid type does change the responseType value.
// was: ["", "arraybuffer", "blob", "document", "json", "text", "stream"], 
// but "stream" is not supported in dart:html.
    for (var type in ["", "arraybuffer", "blob", "document", "json", "text"]) {
        xhr.responseType = type;
        Expect.equals(type, xhr.responseType);
    }

// Setting invalid type should not throw an exception.
    xhr.responseType = "dkjdfkjdfkj";

// Setting invalid type doesn not change the responseType value.
    xhr.responseType = "text";
    xhr.responseType = "asdfasdfasd";
    Expect.equals('text', xhr.responseType);
}