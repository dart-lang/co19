/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 */
import "dart:html";
import "../../../testcommon.dart";
import "pwd.dart";

main() {
  document.body.setInnerHtml('''
    <p>Parser-created script elements:</p>
    <p>Already containing text: <span id="p1">PASS</span></p>
    <p>Already specifying missing source: <span id="p2">PASS</span></p>
    <p>Already specifying valid source: <span id="p5">FAIL</span></p>
    <p>No text and no source: <span id="p3">FAIL</span></p>
    <p>Using setAttribute: <span id="p6">FAIL</span></p>
    <hr>
    <p>Dynamically-inserted script elements:</p>
    <p>Set before insertion: <span id="p7">FAIL</span></p>
    <p>Set after insertion: <span id="p8">FAIL</span></p>
    <p>Set twice before and once after insertion: <span id="p9">FAIL</span></p>
    ''', treeSanitizer: new NullTreeSanitizer());

  jsExec(text) {
    var s = new ScriptElement();
    s.text = text;
    document.head.append(s);
    s.remove();
  }

  jsEval(text) {
    var id = 'eval_area';
    var x = new Element.html('<div id="$id"></div>');
    document.body.append(x);
    jsExec("document.getElementById('$id').textContent=($text).toString();");
    var res = document.getElementById(id).text;
    x.remove();
    return res;
  }

  jsExec('var p5result = "FAIL";');

  document.head.append(new DocumentFragment.html('''
    <script type="text/javascript" id="s1">
    // Parser-created. Has text so it should not load upon setting src.
    </script>
    <script type="text/javascript" id="s2" src="$root/resources/IntentionallyMissingFile.null"></script>
    <script type="text/javascript" id="s5" src="$root/resources/script-set-src-p5pass.js"></script>
    <script type="text/javascript" id="s3"></script>
    <!-- s4 was a self-closing script tag, however that is covered by fast/parser/script-tag-with-trailing-slash.html -->
    <script type="text/javascript" id="s6"></script>
    ''', treeSanitizer: new NullTreeSanitizer()));

  asyncStart();
  window.onLoad.first.then((_) {
    document.getElementById("p5").innerHtml = jsEval('p5result');
    
    (document.getElementById("s1") as ScriptElement).src =
        "$root/resources/script-set-src-p1fail.js";
    (document.getElementById("s2") as ScriptElement).src =
        "$root/resources/script-set-src-p2fail.js";
    (document.getElementById("s5") as ScriptElement).src =
        "$root/resources/script-set-src-p5fail.js";
    (document.getElementById("s3") as ScriptElement).src =
        "$root/resources/script-set-src-p3pass.js";
    (document.getElementById("s6") as ScriptElement).setAttribute(
        "src", "$root/resources/script-set-src-p6pass.js");

    ScriptElement e1 = document.createElement("script");
    e1.type  = "text/javascript";
    e1.src = "$root/resources/script-set-src-p7pass.js";
    document.getElementsByTagName("head")[0].append(e1);

    ScriptElement e2 = document.createElement("script");
    e2.type  = "text/javascript";
    document.getElementsByTagName("head")[0].append(e2);
    e2.src = "$root/resources/script-set-src-p8pass.js";
    
    ScriptElement e3 = document.createElement("script");
    e3.type  = "text/javascript";
    e3.src = "$root/resources/script-set-src-p9failBefore.js";
    e3.src = "$root/resources/script-set-src-p9pass.js";
    e3.onLoad.listen((_) {
      asyncEnd();
    });
    document.getElementsByTagName("head")[0].append(e3);
    e3.src = "$root/resources/script-set-src-p9failAfter.js";
  });
}
