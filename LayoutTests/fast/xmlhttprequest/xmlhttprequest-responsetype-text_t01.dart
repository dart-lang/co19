/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description Tests HttpRequest 'text' loading with the .responseType and .response attributes. 
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
<div class="box"><span class="boxheader">responseText</span>
<pre id="id1">@@No result@@</pre>
</div>
<br>
''';

HttpRequest xhr;

void load(e) {
    print("received response object of type ${xhr.response.runtimeType}");

    // Make sure exception is thrown if responseType is set too late in the loading process.
    // .responseType was previously set to "text".  Let's try setting it to "arraybuffer".
    Expect.throws(() {
        xhr.responseType = "arraybuffer";
    }
    , (ex)=>true
    , "exception not thrown when xhr.responseType is set to valid value too late in the loading process"
    );

    // Get .responseText
    document.getElementById("id1").firstChild.text = xhr.responseText;

    // .response is really just an alias to .responseText when .responseType is set to "text".
    // Make sure they're the same.
    Expect.equals(xhr.response, xhr.responseText, "xhr.response != xhr.responseText.");
    xhr = null;
    asyncEnd();
}

void main() {
    document.body.appendHtml(htmlEL, treeSanitizer: NodeTreeSanitizer.trusted);

    xhr = new HttpRequest();
    xhr.onLoad.listen(load);
    asyncStart();
    xhr.open("GET", "$testSuiteRoot/fast/xmlhttprequest/resources/xmlhttprequest-get-data.xml", async:true);
        
    // Make sure we can set responseType to "text" before send() is called.
    xhr.responseType = "text";
    Expect.equals("text", xhr.responseType, "xhr.responseType was not set to 'text'.");

    xhr.send(null);
}
