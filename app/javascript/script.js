/* global $*/

// votes/showでのアンケートグラフ表示用
const graph_1 = document.getElementById("graph_1");
const graph_2 = document.getElementById("graph_2");
const graph_3 = document.getElementById("graph_3");
const graph_4 = document.getElementById("graph_4");
const table = document.getElementById("table");

$(document).on('turbolinks:load', function() {
    $("#tab-contents .hide").hide();
    $('#tab-menu a').on('click', function(event) {
        $("#tab-contents .tab").hide();
        $("#tab-menu .active").removeClass("active");
        $(this).addClass("active");
        $($(this).attr("href")).show();
        event.preventDefault();
    });
});