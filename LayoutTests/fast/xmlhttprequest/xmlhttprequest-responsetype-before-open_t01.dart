/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description This tests that the XMLHttpRequest responseType attribute is
 * modifiable prior to being in the OPENED state.
 */
import "dart:html";
import "../../../Utils/expect.dart";

void main() {
    var xhr = new HttpRequest();
    xhr.responseType = 'document';
    xhr.open('GET', 'http://mydomain');
    Expect.equals('document', xhr.responseType);
}