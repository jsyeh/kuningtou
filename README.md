# 血戰古寧頭
戰棋桌遊 血戰古寧頭：金門大戰1949  
(Bloody Kuningtou: Battle of Kinmen 1949)

## 事由
在「2022互動技術概論」上課時，銘傳資傳大三同學（徐翌洋、鍾沚霖）期末作品想實作「桌遊-血戰古寧頭」。我覺得作品非常有創意，想了解這類 Wargame 桌遊要如何用 Processing 實作出來。

同學告訴我，這款桌遊是2010年「戰棋雜誌-第1期」附的遊戲。我趕到台北「大安殿」訂了一本，也在露天向 silvanus0321 訂了另一本。隔天拿到第一本雜誌，看完後，動手建立 GitHub 專案倉庫。

- 2022-12-26(一) 上網查相關資料&找賣家，並開始實作
- 2022-12-27(二) 到大安殿訂雜誌，又在露天拍賣加訂一本
- 2022-12-28(三) 到大安殿拿到雜誌，建立GitHub專案

## 程式實作
- 畫出地圖
- `mouseDragged()` 可平移/捲動地圖 或 移動棋子
- `mouseWheel()` 或 兩指移動 可縮放地圖，並縮放棋子
- `class Hexagon` 畫出地圖上的六角形格子
- `class Chess` 方便畫出棋子，並繼承4種類型的棋
- `class Chess4Unit extends Chess` 是戰鬥棋
- `buildAllChess()` 逐一建出棋子
- `setPos()` 為每個棋子準備自己的座標
- mouse 經過棋子上方時，有發亮特效，選取 selectedChess 後，每個棋子皆能移動
- `table1` 表示戰鬥傷害表 combat results table (CRT)

<img width="1028" alt="image" src="https://user-images.githubusercontent.com/3252557/209862631-9b5387c3-e8e8-4998-b6ea-12c39d31ee10.png">

## TODO
- 為不同兵種畫圖
- 放置棋子時要避免重疊，以免之後選取時出錯
- 放置棋子時，要設定對應哪個六角形，以便進行遊戲
- 為每個 Hexagon 格子，設定移動的參數
- 選定棋子後，依據 movement 值，將能到達的 Hexagon 格子發亮，指引能走到哪些地方
- 之後讓圖更具象化
- 之後重構時，Chess 應改名為 [Counter](https://en.wikipedia.org/wiki/Board_wargame#Hex-and-counter)

## 相關文獻
- YouTube: [血戰古寧頭：金門大戰1949 教學影片1](https://www.youtube.com/watch?v=GgwFTSTEq1w) 鄭偉成
  - 發佈於 2010年2月12日
- Steam Community: Tabletop Simulator >  工作坊 > Zero330 的工作坊 > [血戰古寧頭: 金門大戰1949 Bloody Kuningtou: Battle of Kinmen 1949](https://steamcommunity.com/sharedfiles/filedetails/?id=717151124)
  - 發佈於 2016 年 7 月 4 日 下午 5:18
- BGG: BoardGameGeek [Bloody Kuningtou: Battle of Kinmen 1949 (2009)](https://boardgamegeek.com/boardgame/52824/bloody-kuningtou-battle-kinmen-1949)
  - 裡面有原作者 WEI-CHENG CHENG 提供的素材圖 [棋正面](https://boardgamegeek.com/image/660587/bloody-kuningtou-battle-kinmen-1949) [棋背面](https://boardgamegeek.com/image/660588/bloody-kuningtou-battle-kinmen-1949)
- 露天拍賣: [戰棋雜誌 季刊第1期 血戰古寧頭 1949 兵棋雜誌](https://www.ruten.com.tw/item/show?21101238046637)
  - 上架時間： 2011-01-23 10:29:08
- Yahoo!拍賣: [大安殿實體店面 戰棋雜誌第1期《血戰古寧頭 1949》兵棋雜誌 NO.1](https://tw.bid.yahoo.com/item/100426863760)
- Wikipedia: [古寧頭戰役](https://zh.wikipedia.org/wiki/%E5%8F%A4%E5%AF%A7%E9%A0%AD%E6%88%B0%E5%BD%B9)
- Wikipedia: [Battle of Gunintou](https://en.wikipedia.org/wiki/Battle_of_Guningtou)
- Wikipedia: [古寧頭大戰](https://zh.wikipedia.org/zh-tw/%E5%8F%A4%E5%AF%A7%E9%A0%AD%E5%A4%A7%E6%88%B0)
  - 1980年的電影《古寧頭大戰》（The Battle of Ku-Ning-Tou）
