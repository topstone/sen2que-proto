# sen2que-proto

標準入力から英文や和文を流し込むと、穴埋め問題や読み仮名問題を自動生成します。

## Installation

v0.1.0 の時点では RubyGems.org へ登録していません。gem file を入手し、以下のように導入して下さい。

    $ gem install sen2que-proto-0.1.0.gem

英文を処理したい場合は [TreeTagger](https://www.cis.uni-muenchen.de/~schmid/tools/TreeTagger/) をご自身で導入し path を通しておいて下さい。(TreeTagger の license の利用条件をよくお読み下さい。)

和文を処理したい場合は [Mecab](https://github.com/taku910/mecab) をご自身で導入し path を通しておいて下さい。

## Usage

出題したい1文だけを含む file を最初に用意して下さい。以下、和文 file は「ja.txt」、英文 file は「en.txt」として説明します。

### 英文の穴埋め問題を作成する

英文の穴埋め問題は以下のように作成します。(同じ英文から、穴埋め部分が異なる9つの questions が生成されます。)

    $ tag-english en.txt | en2cloze > en.xml

Moodle の question bank の import を開き、file format として　Moodle XML を選び、import category として適切な場所を選んで、「en.xml」を import して下さい。

なお、「en.xml」を import する前に内部の「QQQQ」という文字列を分かりやすい文字列に全置換しておくと便利です (例えば「QQQQ」→「国連憲章第1条」のように全置換しておきます)。

### 和文の穴埋め問題を作成する

和文の穴埋め問題は以下のように作成します。(同じ英文から、穴埋め部分が異なる9つの questions が生成されます。)

    $ mecab ja.txt | ja2cloze > ja.xml

Moodle の question bank の import を開き、file format として　Moodle XML を選び、import category として適切な場所を選んで、「ja.xml」を import して下さい。

なお、「ja.xml」を import する前に内部の「QQQQ」という文字列を分かりやすい文字列に全置換しておくと便利です (例えば「QQQQ」→「国連憲章第1条」のように全置換しておきます)。

### 和文の読み仮名問題を作成する

和文の読み仮名問題は以下のように作成します。

    $ mecab ja.txt | ja2yomi > yomi.txt

Moodle の question bank の import を開き、file format として　GIFT を選び、「yomi.txt」を import して下さい。