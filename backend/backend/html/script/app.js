const lanIP = `${window.location.hostname}:5000`;
const socket = io(`http://${lanIP}`);

let htmlknop
let htmldata


const listenToSocket = function () {
    socket.on("connected", function () {
        console.log("verbonden met socket webserver");
    });

}

const ontvangData = function () {
    socket.on("B2F_waterniveau", (data) => {
        console.log(data)
        document.querySelector(".js-waterniveau").innerHTML = "<p>" + data + "</p>"
    })
}

const listenToButton = function () {
    console.log("listen to button")
    let htmlknop = document.querySelector(".js-button")
    htmlknop.addEventListener("click", function () {
        socket.emit("F2B_ShowData", { value: 'Aanvraag Succesvol' })
        socket.on("B2F_temperature", (data) => {
            console.log(data)
            document.querySelector(".js-temperatuur").innerHTML = "<p>" + data + "°C</p>"

        })
    })

}


document.addEventListener("DOMContentLoaded", function () {
    console.log("DOM geladen");
    toggleNav();
    ontvangData();
    // listenToSocket();
    listenToButton();

});

function toggleNav() {
    let toggleTrigger = document.querySelectorAll(".js-toggle-nav");
    for (let i = 0; i < toggleTrigger.length; i++) {
        toggleTrigger[i].addEventListener("touchstart", function () {
            document.querySelector("html").classList.toggle("has-mobile-nav");
        })
    }
}


