/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description Test XmlHttpRequest response encoding handling
 * Test for <a href="http://bugs.webkit.org/show_bug.cgi?id=14288">bug 14288</a>:
 * HttpRequest doesn't use a correct content type for file:// URLs.
 */
import "dart:html";
import "../../testcommon.dart";

const String url1251 = '$testSuiteRoot/fast/xmlhttprequest/resources/1251.html';

var console_messages;

void log(message) {
//    print(message);
    var item = document.createElement("li");
    item.append(new Text(message));
    console_messages.append(item);
}

void main() {
    console_messages = document.createElement("ol");
    document.body.append(console_messages);
    HttpRequest req;

    void processStateChange(e){
        if (req.readyState == 4) {
            asyncEnd();
            String  charset=req.responseText.replaceAll("/\s/g", "").replaceAll("/.*<body>(.*)<\/body>.*/", r"$1");
            log("Async:HTML, charset determined by a META: $charset");
        }
    }
    
    HttpRequest get(String url, bool async)  {
        req = new HttpRequest();
        
        if (async) {
            asyncStart();
            req.onReadyStateChange.listen(processStateChange);
        }
        
        req.open('GET', url, async:async);
        req.send(null);
        
        return req;
    }

    try {
        req =  get(url1251, false);
        String  charset=req.responseText.replaceAll("/\s/g", "").replaceAll("/.*<body>(.*)<\/body>.*/", r"$1");
        log("Sync: HTML, charset determined by a META: $charset");
    } catch (ex) {
        log("Exception: $ex");
    }

    get(url1251, true);
    
}
