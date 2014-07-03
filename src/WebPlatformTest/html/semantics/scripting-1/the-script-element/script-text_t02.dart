/**
 * after web-platform-tests/html/semantics/scripting-1/the-script-element/script-text.xhtml
 * @assertion
 * http://whatwg.org/html/#dom-script-text
 * @description HTMLScriptElement.text: Getter with CDATA section
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

const String htmlEL = r'''
<script name="script">
<x>7;</x>
<![CDATA[
  var x = "y";
]]>
</script>
''';

void main() {
  document.body.appendHtml(htmlEL);
//  var script = document.body.getElementsByTagName("script")[0];
  var script = document.getElementsByName("script")[0];
  assert_equals(script.text, '\n\n\n  var x = "y";\n\n');
}
