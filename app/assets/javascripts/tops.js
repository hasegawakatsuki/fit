function imgTimer() {
  //画像番号
  count++; //*3
  //画像の枚数確認
  if (count == img.length) count = 0; //*4
  //画像出力
  document.exercise.src = img[count]; //*5
  //次のタイマー呼びだし
  setTimeout("imgTimer()",7500); //*6
}