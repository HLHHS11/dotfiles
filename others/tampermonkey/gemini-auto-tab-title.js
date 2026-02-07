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
    const titleElement = document.querySelector("span.conversation-title");
    const sessionTitle = titleElement?.innerText?.trim() ?? "";

    const newTitle = sessionTitle !== "" ? sessionTitle : DEFAULT_TITLE;
    // 今のタブ名と違う場合だけ更新（無限ループ防止）
    if (document.title !== newTitle) {
      document.title = newTitle;
    }
  };

  // ページ内の変化（チャットの切り替えなど）を監視する設定
  const observer = new MutationObserver((mutations) => {
    updateTitle();
  });

  // 監視の開始
  observer.observe(document.body, {
    childList: true,
    subtree: true,
  });

  // 初回実行
  updateTitle();
})();
