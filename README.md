# Chanjong

## サイト概要

麻雀の役を定義・登録しておくことができるサイト。
さらに、それらの役を使い、ユーザー同士で「役置換麻雀」をサイト上で遊ぶことができる。
アプリ名の由来は「Change」+「Mahjong」、読み方は「チェンジャン(語呂悪い？)」。

### 役置換麻雀とは？

基本は半荘の麻雀。ただし、以下の点が異なる。

- 和了があるたびに、その和了に含まれる役(立直を除く)が、それ以降消滅する。
- 和了したプレイヤーは、消滅した役それぞれに代わり、同じ翻数の役を提案しなければならない。
- 残りのプレイヤーの過半数(＝ 2 人)の同意を得ることで、それらの役が新たに採用される。

### サイトテーマ

上記「役置換麻雀」を遊んでもらう。

### テーマを選んだ理由

学生のころに身内で「役置換麻雀」を遊んでいた。
しかし、オフラインで遊ぶにあたり、以下のような難点があった。

- 現在何の役が有効で、何が消滅しているのかわかりづらい。
  (役の変遷を記録するため、無効な役も取り消し線を引いて残していた)
- 提案すべき役の準備がない場合、その場で悩み始めたり、ローカル役を調べ始めてしまい、
  ゲームが停止してしまう。

これらの難点を解消し、より「役置換麻雀」を遊びやすくすること、
そして、この「役置換麻雀」を多くの人に知ってもらうことがこのアプリの製作目的である。

### ターゲットユーザ

遠く離れている・いないを問わず、少し変わった麻雀を遊びたい身内グループ。
(本サイトを通じて知り合いになったユーザー達も含むが、
めちゃくちゃになりやすいルールなので、ランクマッチや類似機能は実装しない方針である)

### 主な利用シーン

上記のような身内グループが、何かゲームをして遊びたいときの選択肢として。

## 設計書

要件定義/機能一覧
https://docs.google.com/document/d/1QvCFbUbAjoLerILhHCFrkvZ6WYqUcR01xeAucU3tCgY/edit?usp=sharing

UIフロー
https://drive.google.com/file/d/1sYrj6OypVXYsUTDw4Idranl2tMOHGVcl/view?usp=sharing

ER図
https://drive.google.com/file/d/1BBhmGuuuOprL638xR4bUN15QODZ3bg8C/view?usp=sharing

テーブル定義書
https://docs.google.com/spreadsheets/d/1RfGci2em7xrXeMCIlbibxcBXVvCLa4gSPN0QQBtmG_g/edit?usp=sharing

## チャレンジ要素一覧

https://docs.google.com/spreadsheets/d/1opfHW26t-LXvXuCnZHPw6zwD0Px_JR3nEpok0HnwljA/edit?usp=sharing

## 開発環境

- OS：Linux(CentOS)
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails
- JS ライブラリ：jQuery
- IDE：Cloud9

## 使用素材

- 麻雀牌画像 https://mj-king.net/sozai/
- 役の名前等に使用する和風フォント(検討中)