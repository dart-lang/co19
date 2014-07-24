/**
 * after web-platform-tests/webstorage/storage_session_setitem_quotaexceedederr.html
 * @assertion: http://dev.w3.org/html5/webstorage/ 
 * @description 
 */
import 'dart:html';
import "../Utils/expectWeb.dart";

void main() {
    Storage storage=window.sessionStorage;
    storage.clear();

    var index = 0;
    var key = "name";
    var val = "user";

    assert_throws("QuotaExceededError", () {
        while (true) {
            index++;
            storage["${key}${index}"]="${val}${index}";
        }
    });

    storage.clear();
}
