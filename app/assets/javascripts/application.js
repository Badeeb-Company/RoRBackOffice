// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require turbolinks
//= require cocoon
//= require rails.validations
//= require_tree .


function upload(file){
	var config = {
		apiKey: "AIzaSyBiH5nQyb9vwCR9OL0f8ugGajNZHJh90nk",
		authDomain: "waritex-promotions-firebase.firebaseapp.com",
		databaseURL: "https://waritex-promotions-firebase.firebaseio.com",
		projectId: "waritex-promotions-firebase",
		storageBucket: "waritex-promotions-firebase.appspot.com",
		messagingSenderId: "786576419400"
	};

	firebase.initializeApp(config);

	var storageRef = firebase.storage().ref();
	var mountainImagesRef = storageRef.child('images/' + file.name);
	mountainImagesRef.put(file);
}

function showPleaseWait() {
    var modalLoading = '<div class="modal" id="pleaseWaitDialog" data-backdrop="static" data-keyboard="false role="dialog">\
        <div class="modal-dialog">\
            <div class="modal-content">\
                <div class="modal-header">\
                    <h4 class="modal-title">Please wait...</h4>\
                </div>\
                <div class="modal-body">\
                    <div class="progress">\
                      <div class="progress-bar progress-bar-striped active" role="progressbar"\
                      aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width:100%; height: 40px">\
                      </div>\
                    </div>\
                </div>\
            </div>\
        </div>\
    </div>';
    $(document.body).append(modalLoading);
    $("#pleaseWaitDialog").modal("show");
}

function hidePleaseWait() {
    $("#pleaseWaitDialog").modal("hide");
}