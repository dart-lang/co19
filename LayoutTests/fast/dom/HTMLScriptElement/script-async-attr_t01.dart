/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This test checks for proper parsing of the async attribute on 
 * HTML script tags.
 * @note Inverted first assert, since script created scripts default to async=true
 */
import "dart:html";
import "../../../testcommon.dart";
import "pwd.dart";

main() {
  document.body.setInnerHtml('''
    <script id="s0" src="IntentionallyMissingFile.js"></script>
    <script id="s1" src="IntentionallyMissingFile.js" async></script>
    <script id="s2" src="IntentionallyMissingFile.js" async="async"></script>
    <script id="s3" src="IntentionallyMissingFile.js" async="ASYNC"></script>
    <script id="s4" src="IntentionallyMissingFile.js" async="true"></script>
    <script id="s5" src="IntentionallyMissingFile.js" async="false"></script>
    <script id="s6"></script>
    <script id="s7" async></script>
    <script id="s8" async></script>
    ''', treeSanitizer: new NullTreeSanitizer());


  var nextScriptID = 9;

  isAsync(id)
  {
    debug(id);
    return (document.getElementById(id) as ScriptElement).async;
  }

  isDynamicallyInsertedScriptAsync(async)
  {
    var id = "s${nextScriptID++}";
    ScriptElement script = document.createElement("script");
    script.id = id;
    script.src = "$root/resources/script-load.js";
    if (async != null)
      script.async = async;
    document.getElementsByTagName("head")[0].append(script);
    return isAsync(id);
  }

  document.getElementById("s8").attributes.remove("async");

  //shouldBeFalse(isAsync('s0'));
  shouldBeTrue(isAsync('s0'));
  shouldBeTrue(isAsync('s1'));
  shouldBeTrue(isAsync('s2'));
  shouldBeTrue(isAsync('s3'));
  shouldBeTrue(isAsync('s4'));
  shouldBeTrue(isAsync('s5'));
  shouldBeTrue(isAsync('s6'));
  shouldBeTrue(isAsync('s7'));
  shouldBeFalse(isAsync('s8'));
  shouldBeTrue(isDynamicallyInsertedScriptAsync(true));
  shouldBeFalse(isDynamicallyInsertedScriptAsync(false));
  //shouldBeTrue(isDynamicallyInsertedScriptAsync("async")); // NA to dart
  shouldBeTrue(isDynamicallyInsertedScriptAsync(null));
}

