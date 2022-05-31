$(document).ready(() => {
    $('#hamburger-menu').click(() => {
        $('#hamburger-menu').toggleClass('active')
        $('#nav-menu').toggleClass('active')
    })

    let navText=["<i class='fas fa-chevron-left'></i>","<i class='fas fa-chevron-right'></i>"]

    $('.movies-slide').owlCarousel({
        items: 2,
        dots: false,
        nav: true,
        navText: navText,
        margin: 15,
        responsive: {
            500: {
                items: 3
            },
            1280: {
                items: 6
            },
            1600: {
                items: 8
            }
        }
    })

    $('.series-slide').owlCarousel({
        items: 4,
        dots: false,
        nav: true,
        navText: navText,
        margin: 15,
        responsive: {
            500: {
                items: 2
            },
            1280: {
                items: 4
            },
            1600: {
                items: 6
            }
        }
    })
})