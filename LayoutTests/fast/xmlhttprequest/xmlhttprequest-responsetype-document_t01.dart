/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description Tests XMLHttpRequest 'document' loading with the .responseType and .response attributes. 
 */
import "dart:html";
import "../../testcommon.dart";

const String htmlEL = r'''
<style type="text/css">
.box {
  display: box;
  border: 1px solid black;
  margin-bottom: 0.5em;
}
.boxheader {
  font-weight: bold;
  color: maroon;
}
pre {
  margin-left: 2em;
}
</style>
''';

HttpRequest xhr;

void load(e) {
    testPassed('DONE LOADING');
    print("received response object of type : ${xhr.response.runtimeType}.");

    // Make sure exception is thrown if responseType is set too late in the loading process.
    // .responseType was previously set to "document".  Let's try setting it to "arraybuffer".
    Expect.throws((){
        xhr.responseType = "arraybuffer";
    }, (e)=>true
    , "exception not thrown when xhr.responseType is set to valid value too late in the loading process"
    );

    // Check that .response is a Document
    Expect.isTrue(xhr.response is Document);
    Document response=xhr.response;
    Expect.equals('doc', response.documentElement.tagName, "xhr.response should be a Document.");
    
    // .response is really just an alias to .responseXml when .responseType is set to "document".
    // Make sure they're the same.
    Expect.equals(xhr.response, xhr.responseXml, "xhr.response == xhr.responseXml.");

    xhr = null;
    asyncEnd();
}

void main() {
    document.body.appendHtml(htmlEL, treeSanitizer: NodeTreeSanitizer.trusted);

    xhr = new HttpRequest();
    xhr.onLoad.listen(load);
    asyncStart();
    xhr.open("GET", "$testSuiteRoot/fast/xmlhttprequest/resources/xmlhttprequest-get-data.xml", async:true);
        
    // Make sure we can set responseType to "document" before send() is called.
    xhr.responseType = "document";
    Expect.equals("document", xhr.responseType, "xhr.responseType was not set to 'document'.");

    xhr.send(null);
}
