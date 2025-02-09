# 重刻 tankman 坦克大戰
想嘗試「從無到有」用 Processing 打造 2D 坦克大戰 tankman 遊戲

## 源由

- 2025-02-04 我陪兒子參加 Fun AI 2025 營隊(2/4-7)，看到成大資工研究生蘇湘婷的專案 https://github.com/siangting/TankMan_student 裡面 pygame 做的 tankman 很好玩，那是用 mlgame 進行 AI 遊戲的訓練。
- 2025-02-07 在最後一天清晨，我發現那個 AI 訓練 & 執行的2個程式，可能有座標計算 & 角度換算「不一致」的問題，但已經沒時間修正 & 重新訓練 -- 我想到一個演算法，如果有視覺化工具幫忙，有助開發出來。但 pygame 和我熟悉的 Processing 不同，讓我想自己做一個 tankman 專案。當天我也寫出了「會動」的版本。
- 2025-02-09 我想在 GitHub 裡，把我寫程式的過程記錄下來，所以開了這個程式倉庫。

## 過程記錄
- 00 第一步，先將素材準備好，圖片來源：[siangting/TankMan_student](https://github.com/siangting/TankMan_student/tree/main/asset/image)
- 01 檢視圖檔，看到 grass_0.png .. grass_2.png 有3張草地的圖，檢查發現是「亂數」決定的，所以模仿亂數，畫出草地
- 01 在 maps 資料夾裡的 map_1_v_1.tmx 看到 1對1 對戰地圖的 csv 格式（3代表牆），我就把它貼到陣列，畫出牆
- 02 地圖看起來很粗，檢查發現 maps 裡，還有其他大小的地圖，所以我需要兩種不同地圖的大小，用不同陣列、不同變數來做
- 03 將 csv 格式（1:綠坦克、2:藍坦克、3:牆、4:子彈 5:油料）對應的圖做放出來
- 04 將計時圖示、文字（右上時間、下方分數）加入