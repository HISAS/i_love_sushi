$('#myButton').on('click', function () {
  if( navigator.geolocation ) {
    var options = {
      enableHighAccuracy: true,
      timeout: 60000,
      maximumAge: 0
    };
    window.navigator.geolocation.getCurrentPosition(success, error, options);

    function success(pos) {
      document.getElementById("latitude").value = pos.coords.latitude;
      document.getElementById("longitude").value = pos.coords.longitude;
    }
    function error(err) {
      switch(err.code){
          case 0:
              document.getElementById("error").innerHTML = '<p class="alert alert-danger">原因不明のエラーが発生しました。</p>'; break;
          case 1:
              document.getElementById("error").innerHTML = '<p class="alert alert-danger">位置情報の利用が許可されていません。</p>'; break;
          case 2:
              document.getElementById("error").innerHTML = '<p class="alert alert-danger">デバイスの位置が判定できません。</p>'; break;
          case 3:
              document.getElementById("error").innerHTML = '<p class="alert alert-danger">タイムアウトしました。</p>'; break;
      }
    }
  } else {
    document.getElementById("error").innerHTML = '<p class="alert alert-danger">お使いの端末では現在位置検索を利用できません。</p>';
  }
})

function check() {
  if (document.getElementById("latitude").value == "" || document.getElementById("longitude").value == "") {
    event.preventDefault();
    setTimeout( submit, 5000 );
  }
}

function submit() {
  document.getElementById("myForm").submit();
}
