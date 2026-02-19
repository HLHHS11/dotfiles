# Tampermonkeyスクリプト

## Gemini Auto Tab Title

Geminiは以下に示すように、タブタイトルがすべて `Google Gemini` であり、個別の会話タイトルが表示されずタブ管理しにくい。

![Geminiのデフォルトのタブの見た目](./images/gemini-default-tab-title.png)

そこで、Tempermonkeyを用いて会話タイトルをタブタイトルに表示させるスクリプトを作成した。

![これを適用した場合の見た目](./images/gemini-auto-tab-title-appearance.png)

### 更新履歴

https://chatgpt.com/c/69971c45-ffe8-83a6-868d-c44940c163a9

もともと `span.conversation-title` の変化を見ていたのだが、ページ幅が狭いとそれが表示されないので見れない。
そこで、サイドバーのDOMノードに着目して、 `a[data-test-id="conversation"]` なる要素の中でもさらに `selected` が付与されている要素に着目し、その内側の `.conversation-title` 要素のテキストを取得するようにした。

すると、ページ幅が狭くてspanでは表示されていなかったタイトルも取得できるようになった。

ただ１点、Geminiの新規チャットページを直接開いてから、何も送信せず、すぐにサイドバーの履歴から他のチャットを開くと、その際に正しくタイトルが反映されず、ずっと `Google Gemini` と表示される。

これは要修正。
