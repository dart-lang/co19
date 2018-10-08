/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description GET test
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
<div class="box"><span class="boxheader">responseXML serialized</span>
<pre id="id2">@@No result@@</pre>
</div>
<div class="box"><span class="boxheader">getAllResponseHeaders()</span>
<pre id="id3">@@No result@@</pre>
</div>
<div class="box"><span class="boxheader">status</span>
<pre id="id4">@@No result@@</pre>
</div>
<div class="box"><span class="boxheader">statusText</span>
<pre id="id5">@@No result@@</pre>
</div>
<div class="box"><span class="boxheader">readyState</span>
<pre id="id6">@@No result@@</pre>
</div>
<div class="box"><span class="boxheader">Event information</span>
<pre id="id7">@@No result@@</pre>
</div>
''';

void main() {
    document.body.appendHtml(htmlEL, treeSanitizer: NodeTreeSanitizer.trusted);
    
    var p = new HttpRequest();
    
    void myfunc(ProgressEvent e) {
      asyncEnd();
      document.getElementById("id1").firstChild.text = p.responseText;
      if (p.responseXml != null) {
        var s = new XmlSerializer();
        var d = p.responseXml;
        var str = s.serializeToString(d);
        document.getElementById("id2").firstChild.text = str;
      }
      document.getElementById("id3").firstChild.text = p.getAllResponseHeaders();
      document.getElementById("id4").firstChild.text = p.status.toString();
      document.getElementById("id5").firstChild.text = p.statusText;
      document.getElementById("id6").firstChild.text = p.readyState.toString();
      document.getElementById("id7").firstChild.text = '''
      Event object: ${e.toString()}
      Event properties:
      bubbles=${e.bubbles}
      cancelable=${e.cancelable}
      currentTarget=${e.currentTarget}
      defaultPrevented=${e.defaultPrevented}
      eventPhase=${e.eventPhase}
      lengthComputable=${e.lengthComputable}
      loaded=${e.loaded}
      total=${e.total}
      path=${e.path}
      type=${e.type}
    ''';
    }
    
    asyncStart();
    p.onLoad.listen(myfunc);
    p.open("GET", "$testSuiteRoot/fast/xmlhttprequest/resources/xmlhttprequest-get-data.xml");
    
    p.send();
}
