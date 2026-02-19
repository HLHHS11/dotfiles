// ==UserScript==
// @name         Gemini Auto Tab Title
// @namespace    http://tampermonkey.net/
// @version      1.0
// @description  Geminiのチャットタイトルをタブ名に自動反映
// @author       Teruki Yamaguchi
// @match        https://gemini.google.com/app/*
// @grant        none
// ==/UserScript==

(function () {
  "use strict";

  const DEFAULT_TITLE = "Google Gemini";

  const updateTitle = () => {
    const sessionTitle =
      document
        .querySelector('a[data-test-id="conversation"].selected')
        ?.querySelector(".conversation-title")
        ?.textContent?.trim() ?? "";

    const newTitle = sessionTitle || DEFAULT_TITLE;

    // 無限ループ防止（同じタイトルなら変更しない）
    if (document.title !== newTitle) {
      document.title = newTitle;
    }
  };

  // DOM変化監視
  const observer = new MutationObserver((mutations) => {
    for (const m of mutations) {
      // class変化（selected付与/除去）を検知
      if (m.type === "attributes" && m.attributeName === "class") {
        updateTitle();
        return;
      }

      // ノード追加/削除（新チャット生成など）を検知
      if (m.type === "childList") {
        updateTitle();
        return;
      }
    }
  });

  observer.observe(document.body, {
    subtree: true,
    childList: true,
    attributes: true,
    attributeFilter: ["class"],
  });

  // 初回実行
  updateTitle();
})();
