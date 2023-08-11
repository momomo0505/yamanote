// 位置情報の取得を要求する関数
function getLocation() {
  if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(showPosition, showError);
  } else {
      alert("Geolocation is not supported by this browser.");
  }
}

// 位置情報を取得したときのコールバック
function showPosition(position) {
  // ここでサーバーに緯度・経度を送信
  let lat = position.coords.latitude;
  let lon = position.coords.longitude;
  // 例: Ajaxを使用してRailsサーバーにデータをPOSTする
}

// エラーハンドリング
function showError(error) {
  switch(error.code) {
      case error.PERMISSION_DENIED:
          alert("User denied the request for Geolocation.");
          break;
      case error.POSITION_UNAVAILABLE:
          alert("Location information is unavailable.");
          break;
      case error.TIMEOUT:
          alert("The request to get user location timed out.");
          break;
      case error.UNKNOWN_ERROR:
          alert("An unknown error occurred.");
          break;
  }
}