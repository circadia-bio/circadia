/* Circadia Lab pkgdown JS — click-to-copy hex codes */
(function () {
  "use strict";

  // ── Toast ────────────────────────────────────────────────────────────────
  function getToast() {
    var t = document.getElementById("circ-copy-toast");
    if (!t) {
      t = document.createElement("div");
      t.id = "circ-copy-toast";
      document.body.appendChild(t);
    }
    return t;
  }

  function showToast(hex) {
    var t = getToast();
    t.textContent = hex + " copied!";
    t.classList.add("circ-show");
    clearTimeout(t._tid);
    t._tid = setTimeout(function () {
      t.classList.remove("circ-show");
    }, 1800);
  }

  // ── Copy ─────────────────────────────────────────────────────────────────
  window.circCopyHex = function (el) {
    var hex = el.dataset.hex;
    if (!hex) return;

    if (navigator.clipboard && navigator.clipboard.writeText) {
      navigator.clipboard.writeText(hex).then(function () {
        showToast(hex);
      }).catch(function () {
        fallbackCopy(hex);
      });
    } else {
      fallbackCopy(hex);
    }
  };

  function fallbackCopy(text) {
    var ta = document.createElement("textarea");
    ta.value = text;
    ta.style.cssText = "position:fixed;top:-9999px;left:-9999px;opacity:0";
    document.body.appendChild(ta);
    ta.focus();
    ta.select();
    try { document.execCommand("copy"); } catch (e) {}
    document.body.removeChild(ta);
    showToast(text);
  }

  // ── Init toast on load ───────────────────────────────────────────────────
  document.addEventListener("DOMContentLoaded", function () {
    getToast();
  });
})();
